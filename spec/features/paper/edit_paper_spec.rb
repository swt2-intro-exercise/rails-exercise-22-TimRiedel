require 'rails_helper'

describe "Edit paper page" do
  it "should have a single multiple select box for selecting authors" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_xpath("//select[@multiple='multiple']")
  end
end