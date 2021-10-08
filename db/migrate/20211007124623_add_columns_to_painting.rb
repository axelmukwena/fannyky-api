class AddColumnsToPainting < ActiveRecord::Migration[6.1]
  def change
    rename_column :paintings, :body, :description
    add_column :paintings, :image, :string
    add_column :paintings, :date, :string
    add_reference :paintings, :painter, foreign_key: true, null: false
  end
end
