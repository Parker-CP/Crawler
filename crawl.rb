require_relative 'lib/crawler'
crawler = Crawler.new("http://wiprodigital.com/")
crawler.get_links

puts crawler.links
