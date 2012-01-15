class AddBggUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bgg_username, :string
  end

  def self.down
    remove_column :users, :bgg_username
  end
end
