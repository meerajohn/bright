require 'spec_helper'

describe Item do
  it "is invalid without a code" do
    build(:item, code: nil).should_not be_valid
  end

  it "is invalid without a name" do
    build(:item, name: nil).should_not be_valid
  end

  it "is invalid without a kind" do
    build(:item, kind: nil).should_not be_valid
  end

  it "is invalid without a format" do
    build(:item, format: nil).should_not be_valid
  end

  it "is invalid without a language" do
    build(:item, language: nil).should_not be_valid
  end

  it "is invalid without a category_id" do
    build(:item, category_id: nil).should_not be_valid
  end

  it "does not allow duplicate code" do
    create(:item, code: "1234")
    build(:item, code: "1234").should_not be_valid
  end

  it "does not allow duplicate name" do
    create(:item, name: "Classics")
    build(:item, name: "Classics").should_not be_valid
  end 
end
  
