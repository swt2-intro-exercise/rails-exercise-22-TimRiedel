require 'rails_helper'

describe "Author overwiev page" do
  it "should display a table with all authors from the database displaying name and website" do
    @alan = FactoryBot.create :author

    visit authors_path
    
    expect(page).to have_css 'table'
    within 'table' do
      expect(page).to have_text @alan.name
      expect(page).to have_link @alan.homepage, href: 'https://' + @alan.homepage
      expect(page).to have_link 'Show', href: author_path(@alan)
    end
  end

  it "should have a link to create a new author" do
    visit authors_path
    expect(page).to have_link 'Add new author', href: new_author_path
  end
end