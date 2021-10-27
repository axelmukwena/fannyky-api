class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :published_year
      t.string :link
      t.integer :images_count
      t.string :slug
      t.references :painter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, :title, unique: true
  end
end
