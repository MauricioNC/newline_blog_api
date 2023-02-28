class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :tag_name, presence: true, length: {maximum: 20}
  validates_with TagNameValidator
end
