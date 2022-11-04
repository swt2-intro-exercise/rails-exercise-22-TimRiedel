require 'rails_helper'

describe "Author overwiev page" do
  it "should display the full name and website for every author and have a link to open the details page" do
    @alan = FactoryBot.create :author
    visit authors_path
    
    expect(page).to have_css 'table'
    within 'table' do
      expect(page).to have_text 'Name'
      expect(page).to have_text 'Homepage'

      expect(page).to have_text @alan.name
      expect(page).to have_link @alan.homepage, href: 'https://' + @alan.homepage
      expect(page).to have_link 'Show', href: author_path(@alan)
      expect(page).to have_link 'Edit', href: edit_author_path(@alan)
      expect(page).to have_link 'Delete', href: author_path(@alan)
    end
  end

  it "should have a link to create a new author" do
    visit authors_path
    expect(page).to have_link 'Add new author', href: new_author_path
  end

  it "should delete an author from the database on clicking destroy" do
    @alan = FactoryBot.create :author
    visit authors_path
    
    before_count = Author.count
    expect(page).to have_css 'table'
    within 'table' do
      find(:xpath, "//a[text()='Delete']").click()
    end
    expect(Author.count).to eq(before_count - 1)
  end
end