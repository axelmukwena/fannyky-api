class ConvertDateColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :paintings, :date_created, :string
    change_column :exhibitions, :start_date, :string
    change_column :exhibitions, :end_date, :string
    change_column :talks, :date, :string
  end
end
