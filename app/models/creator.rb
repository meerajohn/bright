class Creator < ActiveRecord::Base
  has_many :item_creators, dependent: :restrict_with_error
  has_many :items,  through: :item_creators

  validates_presence_of :kind, :sort_name

  def name
    self.sort_name
  end
end
