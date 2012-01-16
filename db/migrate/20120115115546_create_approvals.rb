class CreateApprovals < ActiveRecord::Migration
  def self.up
    create_table :approvals do |t|
      t.integer :meetup_id
      t.integer :user_id
      t.integer :status
      t.boolean :is_approved
      t.string  :url_to_approve
      t.string  :url_to_reject

      t.timestamps
    end
  end

  def self.down
    drop_table :approvals
  end
end
