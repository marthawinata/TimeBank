class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :meetup_id
      t.string :email
      t.string :secret_url
      t.integer :status, :default => 0 #0 is active
      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
