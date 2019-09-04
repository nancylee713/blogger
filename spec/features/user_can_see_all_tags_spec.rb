require 'rails_helper'

describe "User sees all tags" do
  describe "they visit /tags" do
    it "displays all tags" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create!(name: "tag 1")
      tag_2 = article.tags.create!(name: "tag 2")
      tag_3 = article.tags.create!(name: "tag 3")
      tag_4 = article.tags.create!(name: "tag 4")

      visit tags_path

      expect(page).to have_content tag_1.name
      expect(page).to have_content tag_2.name
      expect(page).to have_content tag_3.name
      expect(page).to have_content tag_4.name
    end

    it "user can delete tags" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create!(name: "tag 1")
      tag_2 = article.tags.create!(name: "tag 2")

      visit tags_path

      expect(page).to have_link("Delete")

      click_link "Delete"
      
    end
  end
end
