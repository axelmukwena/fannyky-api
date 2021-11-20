class AddTypeToExhibitions < ActiveRecord::Migration[6.1]
  def change
    add_column :exhibitions, :type, :string
  end
end
