class Post < ApplicationRecord
  # include ActiveModel::Validations

  has_many :post_tags
  has_many :tags, through: :post_tags

  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: :true, length: {minimum:20, maximum:200}
  validates :description, presence: :true, length: {minimum:0, maximum:256}
  validates :body, presence: :true
  validates_with PostTitleAndDescriptionValidator
end
