require 'spec_helper'

describe Category do
  it "is invalid without a name" do
    build(:category, name: nil).should_not be_valid
  end

  it "is invalid without a code" do
    build(:category, code: nil).should_not be_valid
  end

  it "does not allow duplicate code" do
    create(:category, code: "1234")
    build(:category, code: "1234").should_not be_valid
  end

  it "does not allow duplicate name" do
    create(:category, name: "Classics")
    build(:category, name: "Classics").should_not be_valid
  end
end
