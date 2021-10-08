class ChangeDateCreatedType < ActiveRecord::Migration[6.1]
  def change
    remove_column :paintings, :date_created
    add_column :paintings, :date_created, :date
  end
end
