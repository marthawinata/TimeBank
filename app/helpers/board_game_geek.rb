# To change this template, choose Tools | Templates
# and open the template in the editor.

class BoardGameGeek
  def initialize
    
  end

  def get_boardgames(ids, use_db_if_exists=true)

    if (ids.empty?)
      return []
    end

    boardgames = []

    if (use_db_if_exists)
      existing_boardgames = Boardgame.where(:bgg_id => ids)
      existing_boardgames.each do |existing_boardgame|
        ids.delete(existing_boardgame.bgg_id.to_s)
      end
      boardgames.concat existing_boardgames
    end

    if (!ids.empty?)
      bgg_items = Nokogiri::XML(open("http://www.boardgamegeek.com/xmlapi2/thing?type=boardgame,boardgameexpansion&id=" + ids.join(',')))
      bgg_items.css("item").each do |item|
        boardgames.push(parse_boardgame(item))
      end
    end
    
    return boardgames
  end
  
  def parse_boardgame(element)
    bgg_id = element['id']
    name = element.css('name')
    inbound_links = element.css("link[inbound=true]")
    is_standalone = inbound_links.empty?
    parent_boardgame_id = is_standalone ? nil : inbound_links.first['id']

    if (!name.empty?)
      return Boardgame.new(:name => name.first['value'],
        :bgg_id=> bgg_id,
        :is_standalone=> is_standalone,
        :parent_boardgame_id => parent_boardgame_id)
    end
    
  end

  def get_owned_boardgames(username)
    owned_boardgames = []
    bgg_ids = []

    collection_items_doc = Nokogiri::XML(open("http://www.boardgamegeek.com/xmlapi2/collection?username=#{username}"))
    
    collection_items_doc.css('item').each do |collection_item|
      bgg_ids.push(collection_item['objectid'])
    end

    owned_boardgames.concat(Boardgame.where(:bgg_id => bgg_ids))
    owned_boardgames.each do |owned_boardgame|
      bgg_ids.delete(owned_boardgame.bgg_id.to_s)
    end

    owned_boardgames.concat(get_boardgames(bgg_ids))

    return owned_boardgames
  end

end
