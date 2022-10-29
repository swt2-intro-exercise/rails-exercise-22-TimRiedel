require 'rails_helper'

describe "Author model", type: :model do
  it "should store parameters correctly in a model instance" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
  end

  it "should be able to return the full name" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author.name).to eq("Alan Turing")
  end

  it "should have a last name" do
    author = Author.new(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author).to_not be_valid
  end

  it "must not have a homepage or first name" do
    author = Author.new(last_name: "Turing")
    expect(author).to be_valid
  end
end