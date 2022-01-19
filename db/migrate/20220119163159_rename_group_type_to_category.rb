class RenameGroupTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :paintings, :group_type, :category
    add_column :painters, :paintings_categories,
               :string, array: true, default: []
  end
end
