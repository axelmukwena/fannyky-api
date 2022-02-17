class AddMenuitemsToPainters < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :menuitems,
               :string, array: true, default: []
  end
end
