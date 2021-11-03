class AddExploreToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :explorer, :integer, null: true
    add_column :exhibitions, :explorer, :integer, null: true
    add_column :books, :explorer, :integer, null: true
  end
end
