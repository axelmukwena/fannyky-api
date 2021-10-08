class ChangeAudInAllowlistedJwtAgain < ActiveRecord::Migration[6.1]
  def change
    change_column :allowlisted_jwts, :aud, :string, null: true
  end
end
