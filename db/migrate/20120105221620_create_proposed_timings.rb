class CreateProposedTimings < ActiveRecord::Migration
  def self.up
    create_table :proposed_timings do |t|
      t.integer :meetup_id
      t.integer :proposed_by_user
      t.date :proposed_date
      t.time :proposed_time

      t.timestamps
    end
  end

  def self.down
    drop_table :proposed_timings
  end
end
