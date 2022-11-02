class Category < ApplicationRecord
  validates :disaster, presence: true

  has_many :post_category_ships, dependent: :restrict_with_exception
  has_many :posts, through: :post_category_ships
end
