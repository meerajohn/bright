class Copy < ActiveRecord::Base
  belongs_to :asset

  has_many :issues, dependent: :restrict_with_error
  has_many :reservations, dependent: :restrict_with_error

  validates_presence_of :accession_no, :quality, :status, :asset_id
  validates_uniqueness_of :accession_no

end
