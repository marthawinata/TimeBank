class CreateMeetups < ActiveRecord::Migration
  def self.up
    create_table :meetups do |t|
      t.string :name
      t.integer :host_user_id
      t.date :confirmed_date
      t.time :confirmed_time
      t.text :confirmed_venue
      t.integer :meetup_type_id, :default => Meetup::PUBLIC
      t.text :venue_link
      t.integer :invitation_type_id, :default => Meetup::LIMITED

      t.timestamps
    end
  end

  def self.down
    drop_table :meetups
  end
end
