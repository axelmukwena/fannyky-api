class ChangeCategoryType < ActiveRecord::Migration[6.1]
  def change
    remove_column :painters, :paintings_categories
    add_column :painters, :paintings_categories,
               :string, default: "[]"
  end
end
