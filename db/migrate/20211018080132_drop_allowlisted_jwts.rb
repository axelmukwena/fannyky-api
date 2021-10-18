class DropAllowlistedJwts < ActiveRecord::Migration[6.1]
  def change
    drop_table :allowlisted_jwts
  end
end
