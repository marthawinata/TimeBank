class AddImgUrlToBoardgames < ActiveRecord::Migration
  def self.up
    add_column :boardgames, :img_url, :string
  end

  def self.down
    remove_column :boardgames, :img_url
  end
end
