class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :organizer
      t.integer :images_count
      t.string :slug
      t.references :painter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :awards, :title, unique: true
  end
end
