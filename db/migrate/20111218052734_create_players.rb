class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :colour
      t.string :bgg_username

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
