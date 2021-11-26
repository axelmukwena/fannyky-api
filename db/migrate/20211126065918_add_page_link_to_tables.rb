class AddPageLinkToTables < ActiveRecord::Migration[6.1]
  def change
    remove_index :painters, :name
    add_column :painters, :page_link, :string, null: false, unique: true
    add_index :painters, :page_link, unique: true

    remove_index :paintings, :title
    add_column :paintings, :page_link, :string, null: false, unique: true
    add_index :paintings, :page_link, unique: true

    remove_index :talks, :title
    add_column :talks, :page_link, :string, null: false, unique: true
    add_index :talks, :page_link, unique: true

    remove_index :publications, :title
    add_column :publications, :page_link, :string, null: false, unique: true
    add_index :publications, :page_link, unique: true

    remove_index :exhibitions, :title
    add_column :exhibitions, :page_link, :string, null: false, unique: true
    add_index :exhibitions, :page_link, unique: true

    remove_index :awards, :title
    add_column :awards, :page_link, :string, null: false, unique: true
    add_index :awards, :page_link, unique: true
  end
end
