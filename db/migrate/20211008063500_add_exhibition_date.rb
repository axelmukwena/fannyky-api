class AddExhibitionDate < ActiveRecord::Migration[6.1]
  def change
    add_column :exhibitions, :start_date, :date
    add_column :exhibitions, :end_date, :date
  end
end
