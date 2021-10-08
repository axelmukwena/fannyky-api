class AddSlugToPainters < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :slug, :string
    add_index :painters, :slug, unique: true
  end
end
