class ChangeDateToDateCreated < ActiveRecord::Migration[6.1]
  def change
    rename_column :paintings, :date, :date_created
  end
end
