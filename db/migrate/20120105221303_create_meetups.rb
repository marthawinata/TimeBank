class CreateMeetups < ActiveRecord::Migration
  def self.up
    create_table :meetups do |t|
      t.integer :host_player_id
      t.date :confirmed_date
      t.time :confirmed_time
      t.text :confirmed_venue
      t.string :meetup_type
      t.text :venue_link
      t.string :invitation_type

      t.timestamps
    end
  end

  def self.down
    drop_table :meetups
  end
end
