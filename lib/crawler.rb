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
      next_page = crawlable.pop
      if next_page.include?(@domain)
        page = Nokogiri::HTML(open(next_page))
      else
        page = Nokogiri::HTML(open(@domain + next_page))
      end
      page.search('a').map do |link|
        link = link['href'].rstrip
        if link.include?('/') && !@links.include?(link)
          @links << link
          if link.include?(@domain) || !link.include?('http')
            crawlable << link
          end
        end
      end
      get_links(crawlable)
    end
  end
end
