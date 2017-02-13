require 'open-uri'
require 'nokogiri'
require 'pry'

class Crawler
  attr_reader :links

  def initialize(domain)
    @links = []
    @domain = domain
  end

  def get_links(crawlable = [@domain])
    if crawlable.length > 0
      page = Nokogiri::HTML(open(crawlable.pop))
      page.search('a').map do |link|
        link = link['href'].rstrip
        if link.include?('/') && !@links.include?(link)
          @links << link
        end
      end
    end
  end
end
