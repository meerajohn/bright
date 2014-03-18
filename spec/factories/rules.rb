# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rule do
    category_id 1
    membership_id 1
    mnemonic "MyString"
    name "MyString"
    value 1
  end
end
