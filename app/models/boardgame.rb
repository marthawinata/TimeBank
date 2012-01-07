class Boardgame < ActiveRecord::Base
  has_many :collections
  belongs_to :parent, :class_name => "Boardgame",:foreign_key => "parent_boardgame_id"

  def self.exists?(bgg_id)
    !Boardgame.where("bgg_id = ?",bgg_id).first.nil?
  end

  def self.find_id_through_bgg(bgg_id)
    if Boardgame.where("bgg_id = ?",bgg_id).first.nil?
      return nil
    else
      Boardgame.where("bgg_id = ?",bgg_id).first.id
    end
  end
end
