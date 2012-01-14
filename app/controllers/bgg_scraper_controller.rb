require 'nokogiri'
require 'open-uri'
require 'zlib'
require 'board_game_geek'

class BggScraperController < ApplicationController
  def index
    @boardgames = Boardgame.all
    @collection_items = Collection.all
  end

  def scrape_game
    (1..params[:pages].to_i).each { |page| scrape_page(page) }

    redirect_to :action =>:index
  end

  def get_collection
    bgg = BoardGameGeek.new
    bgg.get_owned_boardgames(params[:username]).each do |owned_boardgame|
      if (owned_boardgame.id.nil?)
        owned_boardgame.save
      end

      if (Collection.where(:boardgame_id => owned_boardgame.id, :user_id => current_user.id).empty?)
        Collection.new(:boardgame_id => owned_boardgame.id, :user => current_user).save
      end
    end

    redirect_to :action =>:index
  end

  def scrape_page(page)
    doc = open("http://boardgamegeek.com/browse/boardgame/page/#{page}")

    if (doc.content_encoding.include?("gzip"))
      doc = Zlib::GzipReader.new(doc)
    end

    doc = Nokogiri::HTML(doc)

    bgg_ids = []
    doc.css('.collection_objectname a').each do |link|
      href = link['href']
      if (href.start_with?('/boardgameexpansion'))
        bgg_ids.push(/\/boardgameexpansion\/([[:digit:]]+)\//.match(href)[1])
      else
        bgg_ids.push(/\/boardgame\/([[:digit:]]+)\//.match(href)[1])
      end
    end

    bgg = BoardGameGeek.new
    bgg.get_boardgames(bgg_ids).each do |boardgame|
      if (boardgame.id.nil?)
        boardgame.save
      end
    end

  end

end


