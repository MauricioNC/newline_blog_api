class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :category_name, presence: true, length: {maximum: 50}
  validates_with CategoryNameValidator
end
