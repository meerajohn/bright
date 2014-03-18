# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :copy do
    asset_id 1
    accession_no "MyString"
    procured_date "2014-03-19"
    quality "MyString"
    status "MyString"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
