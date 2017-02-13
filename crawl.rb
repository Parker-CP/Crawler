require_relative 'lib/crawler'
page = Crawler.new("http://wiprodigital.com/")

puts page.links.length
