class Issue < ActiveRecord::Base
  belongs_to :asset
  belongs_to :copy
  belongs_to :member

  validates_presence_of :copy_id, :member_id, :issued_date, :return_date

end
