class CreateProposedVenues < ActiveRecord::Migration
  def self.up
    create_table :proposed_venues do |t|
      t.integer :meetup_id
      t.integer :proposed_by_player
      t.text :description
      t.text :venue_link

      t.timestamps
    end
  end

  def self.down
    drop_table :proposed_venues
  end
end
