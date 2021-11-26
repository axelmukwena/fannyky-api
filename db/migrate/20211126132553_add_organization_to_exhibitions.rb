class AddOrganizationToExhibitions < ActiveRecord::Migration[6.1]
  def change
    add_column :exhibitions, :organization, :string
  end
end
