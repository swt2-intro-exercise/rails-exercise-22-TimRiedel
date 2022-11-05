require 'rails_helper'

describe "paper show page" do
  it "should display a list of the papers authors" do
    @alan = FactoryBot.create :author
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)

    expect(page).to have_xpath("//li[contains(text(), '#{@alan.name}')]")
  end
end