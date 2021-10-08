class AddIndexToPaintersName < ActiveRecord::Migration[6.1]
  def change
    add_index :painters, :name, unique: true
  end
end
