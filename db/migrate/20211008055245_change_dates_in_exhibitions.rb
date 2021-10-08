class ChangeDatesInExhibitions < ActiveRecord::Migration[6.1]
  def change
    remove_column :exhibitions, :start_date
    remove_column :exhibitions, :end_date
    add_column :exhibitions, :when, :integer
  end
end
