class RemovePainterFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :painter
  end
end
