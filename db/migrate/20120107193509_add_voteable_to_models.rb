class AddVoteableToModels < ActiveRecord::Migration
  def self.up
    add_column :users, :up_votes, :integer, :null => false, :default => 0
    add_column :users, :down_votes, :integer, :null => false, :default => 0

    add_column :available_boardgames, :up_votes, :integer, :null => false, :default => 0
    add_column :available_boardgames, :down_votes, :integer, :null => false, :default => 0

    add_column :proposed_timings, :up_votes, :integer, :null => false, :default => 0
    add_column :proposed_timings, :down_votes, :integer, :null => false, :default => 0

    add_column :proposed_venues, :up_votes, :integer, :null => false, :default => 0
    add_column :proposed_venues, :down_votes, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :users, :up_votes, :down_votes
    remove_column :available_boardgames, :up_votes, :down_votes
    remove_column :proposed_timings, :up_votes, :down_votes
    remove_column :proposed_venues, :up_votes, :down_votes
  end
end
