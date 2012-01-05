class CreateMeetupsPlayers < ActiveRecord::Migration
  def self.up
    create_table :meetups_players do |t|
      t.integer :meetup_id
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meetups_players
  end
end
