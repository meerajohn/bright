class Reservation < ActiveRecord::Base
  belongs_to :asset
  belongs_to :copy
  belongs_to :member

  validates_presence_of :asset_id, :member_id, :reserved_date

end
