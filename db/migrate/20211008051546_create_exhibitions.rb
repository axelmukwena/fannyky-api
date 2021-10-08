class CreateExhibitions < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :link
      t.string :location
      t.string :slug
      t.integer :images_count
      t.references :painter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :exhibitions, :title, unique: true
  end
end
