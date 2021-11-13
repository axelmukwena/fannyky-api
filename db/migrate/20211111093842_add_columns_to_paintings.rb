class AddColumnsToPaintings < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :abstract, :string
    add_column :paintings, :dimension, :string
  end
end
