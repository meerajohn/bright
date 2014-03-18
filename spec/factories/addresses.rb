# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    addressable_type "MyString"
    addressable_id 1
    line_1 "MyString"
    line_2 "MyString"
    landmark "MyString"
    city "MyString"
    state "MyString"
    postal_code "MyString"
    country "MyString"
    mobile "MyString"
    phone_1 "MyString"
    phone_2 "MyString"
    email_1 "MyString"
    email_2 "MyString"
    created_by 1
    updated_by 1
  end
end
