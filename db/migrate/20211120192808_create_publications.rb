class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :organization
      t.string :location
      t.integer :images_count
      t.string :slug
      t.references :painter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :publications, :title, unique: true
  end
end
