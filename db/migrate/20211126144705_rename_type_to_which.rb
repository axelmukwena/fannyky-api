class RenameTypeToWhich < ActiveRecord::Migration[6.1]
  def change
    rename_column :exhibitions, :type, :which
  end
end
