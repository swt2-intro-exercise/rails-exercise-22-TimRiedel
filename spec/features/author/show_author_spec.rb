require 'rails_helper'

describe "Author page" do
  it "should display the details of a given author" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)

    expect(page).to have_text('Alan')
    expect(page).to have_text('Turing')
    expect(page).to have_link('http://wikipedia.de/Alan_Turing')
    expect(page).to have_link 'Back', href: authors_path
  end
end