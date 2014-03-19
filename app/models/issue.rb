class Issue < ActiveRecord::Base
  include Workflow
  workflow_column :status

  belongs_to :asset
  belongs_to :copy
  belongs_to :member

  validates_presence_of :copy_id, :member_id, :issued_date, :return_date
  validate :valid_issued_date
  validate :valid_return_date
  validate :availability
  validate :reservations

  before_save :set_asset
  after_create :update_copy

  scope :open, -> { where(status: :issued) }

  workflow do
    state :issued do
      event :cancel,  transitions_to: :canceled
      event :close,  transitions_to: :closed
    end
    state :canceled
    state :closed

    after_transition do
      update_copy
    end

    on_error do |error, from, to, event, *args|
      errors[:base] << error
    end
  end

private
  def availability
    errors.add(:copy_id, 'This copy is not available for issue. Please review.') \
      if self.copy.issued?
  end

  def reservations
    asset     = self.copy.asset
    reserved  = asset.reservations.open.count
    available = asset.copies.available.count
    errors.add(:copy_id, 'All the copies of this asset are reserved.') \
      unless available > reserved
  end

  def valid_issued_date
    errors.add(:issued_date, 'Issue date should not be in future.') \
      if self.issued_date > Date.today
  end

  def valid_return_date
    errors.add(:return_date, 'Return date should be after issued date.') \
      if self.return_date < issued_date
  end

  def update_copy
    self.copy.update_attribute :issued, (self.current_state.name == :issued)
  end

  def set_asset
    self.asset = self.copy.asset
  end

end
