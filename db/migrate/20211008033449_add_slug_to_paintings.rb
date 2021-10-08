class AddSlugToPaintings < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :slug, :string
    add_index :paintings, :slug, unique: true
  end
end
