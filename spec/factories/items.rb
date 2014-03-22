# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    category_id 1
    code "1001" 
    name "Pride and Prejudice"
    creator_id 1
    subject "MyString"
    kind "Book"
    format "Paperback"
    pages 1
    publisher "DC books"
    published_date "2014-03-19"
    language "English"
    isbn_10 "MyString"
    isbn_13 "MyString"
    rights "Public Domain"
    tags "MyText"
    excerpt "MyText"
    rating 10
    notes "MyText"
    created_by 1
    updated_by 1
  end
end
