class CreatePainters < ActiveRecord::Migration[6.1]
  def change
    create_table :painters do |t|
      t.string :name
      t.text :about
      t.string :image
      t.string :email
      t.string :phone
      t.string :facebook
      t.string :instagram
      t.string :twitter

      t.timestamps
    end
  end
end
