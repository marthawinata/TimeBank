class CreateBoardgamesMeetups < ActiveRecord::Migration
  def self.up
    create_table :boardgames_meetups do |t|
      t.integer :boardgame_id
      t.integer :meetup_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :boardgames_meetups
  end
end
