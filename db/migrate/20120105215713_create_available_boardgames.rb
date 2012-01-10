class CreateAvailableBoardgames < ActiveRecord::Migration
  def self.up
    create_table :available_boardgames do |t|
      t.integer :boardgame_id
      t.integer :meetup_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :available_boardgames
  end
end
