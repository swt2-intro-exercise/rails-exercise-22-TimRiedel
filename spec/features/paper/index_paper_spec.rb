require 'rails_helper'

describe "Index papers page" do
  it "should have a link to edit each paper" do
    @paper = FactoryBot.create :paper
    visit papers_path

    expect(page).to have_xpath("//a[contains(@href, '/papers/1/edit')]")
  end

  it "should have a link to delete each paper, which removes it from the database" do
    @paper = FactoryBot.create :paper
    visit papers_path

    before_count = Paper.count
    expect(page).to have_xpath("//a[@data-turbo-method='delete' and @href='/papers/1']")
    find(:xpath, "//a[@data-turbo-method='delete' and @href='/papers/1']").click()
    expect(Paper.count).to eq(before_count - 1)

  end
end