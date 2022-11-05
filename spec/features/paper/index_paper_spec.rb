require 'rails_helper'

describe "Index papers page" do
  it "should have a link to edit each paper" do
    @paper = FactoryBot.create :paper
    visit papers_path

    expect(page).to have_xpath("//a[contains(@href, '/papers/1/edit')]")
  end
end