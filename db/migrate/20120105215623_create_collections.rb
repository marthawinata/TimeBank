class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.integer :player_id
      t.integer :boardgame_id
      t.text :bought_at

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
