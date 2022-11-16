class AddReferencePostsToRegion < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :address_region
  end
end
