class AddTalksCounterToPainter < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :talks_count, :integer, default: 0, null: false
  end
end
