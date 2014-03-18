# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    asset_id 1
    member_id 1
    reserved_date 1
    status "MyString"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
