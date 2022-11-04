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
end
