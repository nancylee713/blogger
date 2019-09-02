require 'rails_helper'

describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays info for one article" do
      article_1 = Article.create!(title: "Article 1", body: "Sample text")

      visit articles_path

      click_link article_1.title

      expect(current_path).to eq(article_path(article_1))

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
