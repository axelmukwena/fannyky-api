class ChangeExplorerToData < ActiveRecord::Migration[6.1]
  def change
    remove_column :exhibitions, :explorer
    add_column :exhibitions, :explorer, :datetime, null: true

    remove_column :paintings, :explorer
    add_column :paintings, :explorer, :datetime, null: true

    remove_column :books, :explorer
    add_column :books, :explorer, :datetime, null: true
  end
end
