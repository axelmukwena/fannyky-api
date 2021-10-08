class AddCounterCache < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :images_count, :integer
    add_column :paintings, :images_count, :integer
  end
end
