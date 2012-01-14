require 'nokogiri'
require 'open-uri'
require 'zlib'

class BggScraperController < ApplicationController
  def index
    @boardgames = Boardgame.all
  end

  def scrape_game
    (1..10).each { |page| scrape_page(page) }

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

    bgg_items = Nokogiri::XML(open("http://www.boardgamegeek.com/xmlapi2/thing?type=boardgame,boardgameexpansion&id=" + bgg_ids.join(',')))
    bgg_items.css("item").each do |item|
      bgg_id = item['id']
      name = item.css('name')
      inbound_links = item.css("link[inbound=true]")
      is_standalone = inbound_links.empty?
      parent_boardgame_id = is_standalone ? nil : inbound_links.first['id']

      if (Boardgame.where(:bgg_id => bgg_id).empty? && !name.empty?)
        boardgame = Boardgame.new(:name => name.first['value'],
              :bgg_id=> bgg_id,
              :is_standalone=> is_standalone,
              :parent_boardgame_id => parent_boardgame_id)
        boardgame.save
      end
    end

  end

end


