# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    category_id 1
    code "MyString"
    name "MyString"
    author "MyString"
    author_sort "MyString"
    subject "MyString"
    kind "MyString"
    format "MyString"
    pages 1
    publisher "MyString"
    published_date "2014-03-19"
    language "MyString"
    isbn_10 "MyString"
    isbn_13 "MyString"
    rights "MyString"
    tags "MyText"
    excerpt "MyText"
    rating "MyText"
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
