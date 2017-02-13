require_relative 'lib/crawler'

# This url determines which website you will be scraping
url = "http://wiprodigital.com"

# If you encounter a bad URI error please check the spelling of the website


# DO NOT TOUCH CODE BELOW THIS LINE --------------------------------------------
crawler = Crawler.new(url)
crawler.get_links

title = crawler.domain.gsub("http://www.", "")

found_domains = crawler.links.sort

sub_domains = found_domains.find_all do |target_domain|
  target_domain.include?(title)
end

external_domains = found_domains.find_all do |target_domain|
   !target_domain.include?(title)
 end

File.open("./scraped/#{title}.md", "w+") do |file|
  file.puts(found_domains)
end

puts "total found: #{found_domains.length}"
puts "sub domains found: #{sub_domains.length}"
puts "external domains found: #{external_domains.length}"
puts "Generated #{crawler.links.length} links at /scraped/#{title}.txt"
