require 'rails_helper'

describe "user create a new article" do
  describe "they link from the articles index" do
    describe "they fill in a title and body" do
      it "creates a new article" do
        visit articles_path
        click_link "Create New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New title"
        fill_in "article[body]", with: "New body"
        click_on "Create Article"

        expect(page).to have_content("New title")
        expect(page).to have_content("New body")
        expect(page).to have_content("New article was created!")
      end
    end
  end
end
