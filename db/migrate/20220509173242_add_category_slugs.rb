class AddCategorySlugs < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :category_slug, :string
  end
end
