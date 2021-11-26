class RemoveOrganizerFromAward < ActiveRecord::Migration[6.1]
  def change
    remove_column :awards, :organizer
  end
end
