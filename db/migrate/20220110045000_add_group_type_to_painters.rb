class AddGroupTypeToPainters < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :group_type, :string
  end
end
