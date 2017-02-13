require_relative 'test_helper'

class CrawlerTest < Minitest::Test

  def setup
    @crawler = Crawler.new("http://copper-falls-market.herokuapp.com")
  end

  # def test_crawler_can_get_home_page_links
  #   @crawler.get_links
  #   assert_equal 176, @crawler.links.length
  # end

  def test_domain_with_http_and_www_is_saved
    new_crawler = Crawler.new("http://www.domain.com")
    assert_equal "http://www.domain.com", new_crawler.domain
  end

  def test_domain_with_only_http_is_saved_with_both
    new_crawler = Crawler.new("http://domain.com")
    assert_equal "http://www.domain.com", new_crawler.domain
  end

  def test_domain_with_only_www_is_saved_with_both
    new_crawler = Crawler.new("www.domain.com")
    assert_equal "http://www.domain.com", new_crawler.domain
  end

  def test_domain_with_neither_is_saved_with_both
    new_crawler = Crawler.new("domain.com")
    assert_equal "http://www.domain.com", new_crawler.domain
  end
end
