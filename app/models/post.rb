class Post < ApplicationRecord
  include Discard::Model
  validates :title, presence: true
  validates :content, presence: true
  after_validation :generate_short_string
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships

  private

  def generate_short_string
    loop do
      @unique_string = sprintf "%04d", rand(2 - 9999)
      break unless Post.exists?(unique_id: @unique_string)
    end
    self.unique_id = @unique_string
  end
end
