class AddColumnUniqueIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :unique_id, :string
  end
end
