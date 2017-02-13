# Crawler
This is a basic web crawler. On the crawl.rb file you specify which URL you would like to crawl, and then run      
`ruby crawl.rb` from the terminal. To run the test suite enter `rake` from the terminal.

### Installation
##### 1 - enter `git clone git@github.com:Parker-CP/crawler.git` into the terminal     
##### 2 - enter `bundle install` to install the necessary gems to run the program     
Once those two steps are complete you will be able to enter `ruby crawl.rb` to run the file. The default website to crawl is wiprodigital.com, however you can change this by opening the crawl.rb file (`open crawl.rb`) and then changing the URL that is specified.  

### Trade-offs 
  - I chose to use the nokogiri gem over the mechanize gem as I felt mechanize provided too many tools and limited the learning potential of the project. Nokogiri provides everything necessary for the task to be accomplished and allows me the freedom to implement my own code to achieve the results I am looking for.     
  - Decided to not have user input determine the website to crawl. I explored this option for a time, where the user would enter the website they wished to crawl into the terminal and then the program would launch and crawl. It worked well as long as the user didn’t make any typos - which was something I didn’t feel comfortable relying on. The user can still take control over what website they crawl, they just have to edit the url of the crawl file. I feel like this decision made the program feel a little more cumbersome, but provided more stability.     
  - The program writes the links to a file instead of to the terminal. Writing the links to the terminal was a bit overwhelming and tough to read. This addition allows a user to essentially archive website links in an organized order. It felt empty without any information in the terminal, so I added the status of the crawler as well as a summary when the program was finished.     
  - Crawler is written as a class instead of just a single script as I felt it allowed for more expandability than having one script file accomplish this task. Overall it made the program feel more polished and added to the readability of the code.     
  
### Enhancements
  - The biggest enhancement I can see making in the future is having each page know which links it has on it giving it the abilitiy to display the sitemap in a way that is more human-readable. My initial thought on this would be to develop a small rails app and store the links into postgres database that had a single self-referential table. I would have to implement user input in this case - which would require a series of checks before launching the crawler.     
  - It would be nice to be able to give the crawler the capability to crawl multiple sites at the same time. A quick way to accomplish this would be to initialize the crawler object with an array of targeted domains, and iterate over each of those domains to create their own sitemaps. This wouldn’t be simultaneous, but it would be continuous.
