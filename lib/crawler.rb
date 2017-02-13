require 'open-uri'
require 'nokogiri'

class Crawler
  attr_reader :links,
              :domain

  def initialize(domain)
    @links = []
    @domain = format_domain(domain)
  end

  def get_links(crawlable = [@domain])
    if crawlable.length > 0
      page = visit_new_page(crawlable.pop)
      find_links(page, crawlable)
      get_links(crawlable)
    end
  end

  private

  def find_links(page, crawlable)
    page.search('a').map do |link|
      link = link['href'].rstrip
      if link.include?('/') && !@links.include?(link)
        @links << link
        if link.include?(@domain.gsub("www.", "")) || link.include?(@domain) || !link.include?('http')
          crawlable << link
        end
      end
    end
  end

  def visit_new_page(next_page)
    if next_page.include?(@domain.gsub("www.", "")) || next_page.include?(@domain)
      page = Nokogiri::HTML(open(next_page))
    else
      page = Nokogiri::HTML(open(@domain + next_page))
    end
  end

  def format_domain(domain)
    if domain.include?("http://") && domain.include?("www.")
      domain
    elsif domain.include?("http://")
      domain = domain.insert(7, "www.")
    elsif domain.include?("www.")
      domain = "http://" + domain
    else
      domain = "http://www." + domain
    end
    domain
  end

end
