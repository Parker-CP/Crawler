require_relative 'test_helper'

class CrawlerTest < Minitest::Test

  def setup
    @crawler = Crawler.new("http://copper-falls-market.herokuapp.com")
  end

  def test_crawler_can_get_home_page_links
    @crawler.get_links
    assert_equal 176, @crawler.links.length
  end
end
