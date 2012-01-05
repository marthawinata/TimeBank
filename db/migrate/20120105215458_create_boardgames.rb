class CreateBoardgames < ActiveRecord::Migration
  def self.up
    create_table :boardgames do |t|
      t.integer :bgg_id
      t.string :name
      t.integer :parent_boardgame_id
      t.boolean :is_standalone

      t.timestamps
    end
  end

  def self.down
    drop_table :boardgames
  end
end
