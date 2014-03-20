# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :creator do
    kind "MyString"
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    full_name "MyString"
    sort_name "MyString"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
