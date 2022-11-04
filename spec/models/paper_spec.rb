require 'rails_helper'

describe "Paper model" do
  it "should store parameters correctly in a model instance" do
    @alan = FactoryBot.create :author
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(paper.venue).to eq("Mind 49: 433-460")
    expect(paper.year).to eq(1950)
    # expect(paper.authors).to be_kind_of(Array)
    # expect(paper.authors.length).to eq(1)
  end

  it "should have a last name and venue" do
    paper = Paper.new(year: 2000)
    expect(paper).to_not be_valid
  end

  it "is not required to have a venue and year" do
    paper = Paper.new(title: "A wonderful paper", venue: "A Venue")
    expect(paper).to be_valid
  end
end
