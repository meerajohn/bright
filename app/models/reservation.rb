class Reservation < ActiveRecord::Base
  include Workflow
  workflow_column :status

  belongs_to :item
  belongs_to :member

  validates_presence_of :item_id, :member_id, :reserved_date
  validate :valid_reserved_date

  scope :open, -> { where(status: :reserved) }

  workflow do
    state :reserved do
      event :cancel,  transitions_to: :canceled
      event :close,  transitions_to: :closed
    end
    state :canceled
    state :closed

    on_error do |error, from, to, event, *args|
      errors[:base] << error
    end
  end

private

  def valid_reserved_date
    errors.add(:reserved_date, 'Reservation date should not be in future.') \
      if self.reserved_date > Date.today
  end

end
