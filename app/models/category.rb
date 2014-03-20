class Category < ActiveRecord::Base
  has_many :items, dependent: :restrict_with_error

  validates_presence_of :code, :name
  validates_uniqueness_of :code

end
