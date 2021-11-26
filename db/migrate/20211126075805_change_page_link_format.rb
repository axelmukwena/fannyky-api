class ChangePageLinkFormat < ActiveRecord::Migration[6.1]
  def change
    rename_column :painters, :page_link, :pagelink
    rename_column :talks, :page_link, :pagelink
    rename_column :paintings, :page_link, :pagelink
    rename_column :exhibitions, :page_link, :pagelink
    rename_column :awards, :page_link, :pagelink
    rename_column :publications, :page_link, :pagelink
  end
end
