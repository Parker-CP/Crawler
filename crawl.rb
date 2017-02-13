require_relative 'lib/crawler'

crawler = Crawler.new("http://wiprodigital.com")
# crawler = Crawler.new("http://race-condition.org")
crawler.get_links

puts crawler.links.length
