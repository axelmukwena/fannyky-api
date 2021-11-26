class RemoveSpecificCounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :painters, :books_count
    remove_column :painters, :images_count

    remove_column :exhibitions, :images_count
    remove_column :talks, :images_count
    remove_column :paintings, :images_count
    remove_column :awards, :images_count
    remove_column :publications, :images_count
  end
end
