class Category < ApplicationRecord
  validates :disaster_types, presence: true

  has_many :post_category_ships
  has_many :posts, through: :post_category_ships
end
