class AddRankToPainters < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :rank, :integer
    add_index :painters, :rank, unique: true
  end
end
