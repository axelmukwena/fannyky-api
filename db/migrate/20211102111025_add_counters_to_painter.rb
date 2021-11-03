class AddCountersToPainter < ActiveRecord::Migration[6.1]
  def change
    add_column :painters, :paintings_count, :integer, default: 0, null: false
    Painter.find_each { |painter| Painter.reset_counters(painter.id, :paintings) }

    add_column :painters, :exhibitions_count, :integer, default: 0, null: false
    Painter.find_each { |painter| Painter.reset_counters(painter.id, :exhibitions) }

    add_column :painters, :books_count, :integer, default: 0, null: false
    Painter.find_each { |painter| Painter.reset_counters(painter.id, :books) }
  end
end
