class ChangeTwitterUrlHashSettingOnCheckins < ActiveRecord::Migration
  def change
    change_column :checkins, :twitter_url_hash, :string, null: true, default: nil
    add_index     :checkins, :twitter_url_hash, unique: true
  end
end
