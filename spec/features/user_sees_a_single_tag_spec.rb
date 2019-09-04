require 'rails_helper'

describe "User sees a single tag" do
  describe "they link from the show page" do
    it "user sees a tag name" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)

      expect(page).to have_link tag.name

      click_link tag.name

      expect(current_path).to eq(tag_path(tag))
    end
  end
end
