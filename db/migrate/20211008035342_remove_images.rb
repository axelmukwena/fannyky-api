class RemoveImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :paintings, :image
    remove_column :painters, :image
  end
end
