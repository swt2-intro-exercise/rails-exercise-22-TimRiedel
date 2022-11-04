require 'rails_helper'

describe "Author edit page" do
  it "should have a text inputs for an authors first name, last name, and homepage filled out with form data" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)

    expect(page).to have_xpath("//input[@value='#{@alan.first_name}']")
    expect(page).to have_xpath("//input[@value='#{@alan.last_name}']")
    expect(page).to have_xpath("//input[@value='#{@alan.homepage}']")
  end

  it "should update the entry in the database on clicking submit" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[last_name]', with: 'NewTuring'
    find('input[type="submit"]').click

    author = Author.find_by! first_name: 'Alan'
    expect(author.first_name).to eq(@alan.first_name)
    expect(author.last_name).to eq('NewTuring')
    expect(author.homepage).to eq(@alan.homepage)
  end

  it "should return to the edit page displaying an error when an invalid author is entered" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[last_name]', with: ''
    find('input[type="submit"]').click

    expect(page).to have_text("error")
  end
end