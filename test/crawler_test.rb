require_relative 'test_helper'

class CrawlerTest < Minitest::Test

  def setup
    @crawler = Crawler.new("http://wiprodigital.com/")
  end

  def test_crawler_can_get_home_page_links
    @crawler.get_links
    assert_equal 334, @crawler.links.length
  end
end
