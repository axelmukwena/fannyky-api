class AddRankDateToColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :exhibitions, :rankdate, :date
    add_column :paintings, :rankdate, :date
    add_column :publications, :rankdate, :date
    add_column :talks, :rankdate, :date
  end
end
