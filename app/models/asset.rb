class Asset < ActiveRecord::Base
  belongs_to :category

  has_many :issues, dependent: :restrict_with_error
  has_many :reservations, dependent: :restrict_with_error

  validates_presence_of :code, :name, :kind, :format, :language, :category_id
  validates_uniqueness_of :code

end
