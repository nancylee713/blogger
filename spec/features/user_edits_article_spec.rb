require 'rails_helper'

describe "user can edit an article" do
  describe "they link from the show page" do
    describe "they edit fields in a form" do
      it "displays all articles with updated entry" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article_1)

        click_link "Edit"

        new_title = "Another title"
        new_body = "Another body"

        fill_in "article[title]", with: new_title
        fill_in "article[body]", with: new_body

        click_on "Update"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content(new_title)
        expect(page).to have_content("Article #{new_title} was updated.")
      end
    end
  end
end
