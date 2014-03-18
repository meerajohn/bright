class Member < ActiveRecord::Base
  belongs_to :membership

  has_many :issues, dependent: :restrict_with_error
  has_many :reservations, dependent: :restrict_with_error

  validates_presence_of :code, :name, :membership_id
  validates_uniqueness_of :code

end
