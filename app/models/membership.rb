class Membership < ActiveRecord::Base
  has_many :members, dependent: :restrict_with_error

  validates_presence_of :code, :name
  validates_uniqueness_of :code

end
