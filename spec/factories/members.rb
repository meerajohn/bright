# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    membership_id 1
    code "MyString"
    name "MyString"
    kind "MyString"
    gender "MyString"
    age_group "MyString"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
