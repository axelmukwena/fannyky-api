class RemoveExplorers < ActiveRecord::Migration[6.1]
  def change
    remove_column :exhibitions, :explorer
    remove_column :paintings, :explorer
    remove_column :books, :explorer
  end
end
