class AddCategoryIdToPaintings < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :category_id, :integer
  end
end
