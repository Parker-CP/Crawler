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

  def fetch
    # go to home page
    # add homepage to visited
    # add links on home page to link array
    # visit next page if not already visited
    # add page to visited
    # add links to links array
    # repeat until counter is same number as array
  end


  def get_links
    @links = page.search('a').map do |link|
      link['href']
    end.uniq
  end

end
