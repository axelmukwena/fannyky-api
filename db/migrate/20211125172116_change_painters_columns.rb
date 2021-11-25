class ChangePaintersColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :painters, :facebook
    remove_column :painters, :instagram
    remove_column :painters, :twitter
    add_column :painters, :link, :string
  end
end
