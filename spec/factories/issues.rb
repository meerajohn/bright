# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    asset_id 1
    member_id 1
    issued_date 1
    kind "MyString"
    status "MyString"
    return_date "MyString"
    extension 1
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
