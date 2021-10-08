class AddReferenceToPainters < ActiveRecord::Migration[6.1]
  def change
    add_reference :painters, :user, null: false
  end
end
