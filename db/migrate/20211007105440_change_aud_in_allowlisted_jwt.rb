class ChangeAudInAllowlistedJwt < ActiveRecord::Migration[6.1]
  def change
    change_column :allowlisted_jwts, :aud, :string, null: true, default: "UNKNOWN"
  end
end
