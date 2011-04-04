xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Netaudio London News"
    xml.description "Live music, conference, sound art, broadcast"
    xml.link "http://netaudiolondon.org/news"

    for news_item in @news_items
      xml.item do
        xml.title news_item.headline
        xml.description news_item.content
        xml.pubDate news_item.updated_at.to_s(:rfc822)
        xml.link "http://netaudiolondon.org/news/#{news_item.friendly_id}"
        xml.guid "http://netaudiolondon.org/news/#{news_item.friendly_id}"
      end
    end
  end
end