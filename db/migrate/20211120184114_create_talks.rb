class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :organizer
      t.string :location
      t.string :link
      t.integer :images_count
      t.string :slug
      t.references :painter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :talks, :title, unique: true
  end
end
