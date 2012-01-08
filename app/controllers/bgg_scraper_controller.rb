require 'nokogiri'
require 'open-uri'

class BggScraperController < ApplicationController
  def index
    @boardgames = Boardgame.all
  end

  def scrape_game

    for bgg_id in (params[:scrape_from].to_i..params[:scrape_until].to_i)
      doc = Nokogiri::XML(open("http://www.boardgamegeek.com/xmlapi/boardgame/" + bgg_id.to_s))
      
      name = doc.xpath('//name[@primary]')
      unless (Boardgame.exists?(bgg_id))
        unless (name.empty?)
          is_standalone = doc.xpath('//boardgameexpansion [@inbound="true"]')
          unless (is_standalone.empty?)
            parent_bgg_id = doc.xpath('//boardgameexpansion [@inbound="true"]').first.get_attribute('objectid')
            parent_boardgame_id = Boardgame.find_id_through_bgg(parent_bgg_id)
            is_standalone = false
          else
            is_standalone = true
            parent_boardgame_id = nil
          end
          boardgame = Boardgame.new(:name => name.first.content,
            :bgg_id=> bgg_id,
            :is_standalone=> is_standalone,
            :parent_boardgame_id => parent_boardgame_id)
          boardgame.save
        end
      end
    end

    redirect_to :action =>:index
  end

end


