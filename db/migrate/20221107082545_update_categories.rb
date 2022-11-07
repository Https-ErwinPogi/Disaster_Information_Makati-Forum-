class UpdateCategories < ActiveRecord::Migration[7.0]
  def change
    Category.find_or_create_by(disaster: 'Covid')
    Category.find_or_create_by(disaster: 'Earthquake')
    Category.find_or_create_by(disaster: 'Typhoon')
  end
end
