class CreateMeetupsUsers < ActiveRecord::Migration
  def self.up
    create_table :meetups_users, :id => false do |t|
      t.integer :meetup_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meetups_users
  end
end
