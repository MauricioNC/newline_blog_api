class Post < ApplicationRecord
  # include ActiveModel::Validations

  has_many :post_tags, dependent: :delete_all
  has_many :tags, through: :post_tags, dependent: :delete_all

  has_many :post_categories, dependent: :delete_all
  has_many :categories, through: :post_categories, dependent: :delete_all

  validates :title, presence: :true, length: {minimum:20, maximum:200}
  validates :description, presence: :true, length: {minimum:0, maximum:256}
  validates :body, presence: :true
  validates_with PostTitleAndDescriptionValidator
end
