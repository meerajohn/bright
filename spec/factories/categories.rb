# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    parent_id 1
    code "MyString"
    name "MyString"
    kind "MyString"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
