class AddIndexToPaintingTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :paintings, :title, unique: true
  end
end
