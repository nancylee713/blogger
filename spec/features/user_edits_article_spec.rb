require 'rails_helper'

describe "user can edit an article" do
  describe "they link from the show page" do
    describe "they edit fields in a form" do
      it "displays all articles with updated entry" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article_1)

        click_link "Edit"

        fill_in "article[title]", with: "Another title"
        fill_in "article[body]", with: "Another body"

        click_on "Update"

        expect(current_path).to eq(articles_path)
        expect(page).to have_content(article_1.title)
      end
    end
  end
end
