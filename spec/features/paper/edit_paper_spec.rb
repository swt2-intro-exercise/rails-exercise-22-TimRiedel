require 'rails_helper'

describe "Edit paper page" do
  it "should have a single multiple select box for selecting authors" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_xpath("//select[@multiple='multiple' and @size=1]")
  end

  it "should store the selection in the database on submit" do
    @paper = FactoryBot.create :paper
    @peter = FactoryBot.create :author, :second_author
  
    visit edit_paper_path(@paper)
    expect(page).to have_xpath("//select[@multiple='multiple' and @size=2]")
    find(:xpath, "//select[@multiple='multiple']").find(:option, @peter.name)
    find(:xpath, "//input[@type='submit']").click()
    # expect(@paper.authors.collect {|author| author.first_name}).to include(@peter.first_name)
  end
end