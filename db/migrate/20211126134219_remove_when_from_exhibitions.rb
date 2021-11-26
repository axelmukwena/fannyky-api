class RemoveWhenFromExhibitions < ActiveRecord::Migration[6.1]
  def change
    remove_column :exhibitions, :when
  end
end
