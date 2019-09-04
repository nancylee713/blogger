require 'rails_helper'

describe Tag, type: :model do
  describe "Relationships" do
    it {should have_many :taggings }
    it {should have_many(:articles).through(:taggings) }
  end

  describe "instance methods" do
    it "converts each tag to string" do
      tag = Tag.create!(name: 'ruby, technology')
      expect(tag.to_s).to eq('ruby, technology')
    end
  end
end
