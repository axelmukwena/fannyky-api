class AddLinkToPublications < ActiveRecord::Migration[6.1]
  def change
    add_column :publications, :link, :string
  end
end
