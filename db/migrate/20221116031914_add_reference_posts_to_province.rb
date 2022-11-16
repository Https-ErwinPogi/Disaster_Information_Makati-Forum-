class AddReferencePostsToProvince < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :address_province
  end
end
