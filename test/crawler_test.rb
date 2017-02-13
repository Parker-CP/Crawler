require_relative 'test_helper'

class CrawlerTest < Minitest::Test

  def setup
    @crawler = Crawler.new("http://wiprodigital.com/")
  end

  def test_crawler_has_website
    assert_equal "http://wiprodigital.com/", @crawler.url
  end

  def test_crawler_has_xml
    assert_equal Nokogiri::XML::NodeSet, @crawler.page.css('body').class
  end

  def test_crawler_can_get_all_page_links
    @crawler.get_links
    assert_equal 334, @crawler.links.length
  end
end
