require 'open-uri'
require 'nokogiri'

class Crawler
  attr_reader :url,
              :page,
              :links

  def initialize(url)
    @links = []
    @visited = []
    @url = url
    @page = Nokogiri::HTML(open(url))
  end

  def get_links
    @links = page.search('a').map do |link|
      link['href']
    end.uniq
  end

end
