class RenameTitleToPrize < ActiveRecord::Migration[6.1]
  def change
    rename_column :awards, :title, :prize
  end
end
