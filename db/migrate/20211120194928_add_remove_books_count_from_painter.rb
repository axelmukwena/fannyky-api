class AddRemoveBooksCountFromPainter < ActiveRecord::Migration[6.1]
  def change
    remove_column :painters, :books_count
  end
end
