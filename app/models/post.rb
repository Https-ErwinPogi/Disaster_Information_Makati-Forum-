class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :comments
  has_many :categories, through: :post_category_ships
end
