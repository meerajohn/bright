class Copy < ActiveRecord::Base
  # constants
  STATUS_AVAILABLE   = 'a'
  STATUS_MISPLACED   = 'm'
  STATUS_LOST        = 'l'
  STATUS_UNAVAILABLE = 'u'
  QUALITY_NEW        = 'n'
  QUALITY_USED       = 'u'
  QUALITY_WORN_OUT   = 'w'
  QUALITY_DAMAGED    = 'd'

  belongs_to :asset

  has_many :issues, dependent: :restrict_with_error

  validates_presence_of :name, :quality, :status, :asset_id
  validates_uniqueness_of :name
  validate :valid_procured_date
  validate :unit_quantity_is_issuable
  validate :return_before_change_status

  scope :available, -> { where(status: STATUS_AVAILABLE, issuable: true, issued: false) }

  before_create :set_quantity

  def issuable?
    self.issuable == true
  end

  def issued?
    self.issued == true
  end

private
  def valid_procured_date
    errors.add(:procured_date, 'Procured date should not be in future.') \
      if procured_date && self.procured_date > Date.today
  end

  def unit_quantity_is_issuable
    errors.add(:quantity, 'Issuable assets should be 1 per copy') \
      if self.issuable? && quantity != 1
  end 

  def return_before_change_status
    errors.add(:status, 'Return the book before the changing the status') \
      if self.status_was != self.status && self.issued?
  end

  def set_quantity
    self.quantity ||= 1
  end

end
