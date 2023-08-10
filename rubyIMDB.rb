
require 'nokogiri'
require 'open-uri'
require 'net/http'

# Create a URIMovies object
uri = URI.parse("https://m.imdb.com/chart/top")

# Create an HTTP request with headers
request = Net::HTTP::Get.new(uri)
request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'

# Send the request and get the response
response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  http.request(request)
end

# Parse the response body using Nokogiri
doc = Nokogiri::HTML(response.body)

# count = gets
# movies_array = Array.new(count)

# moviesMate = doc.css('h3','ipc-title__text')
# moviesMate.each do |title|
  
#   puts title.content
temp1 = gets
temp = temp1.to_i
ind = 0;
arrMovies = Array.new(100)
arrLinks = Array.new(100)
thread = Thread.new() do
  doc.css('a.ipc-title-link-wrapper').each do |title|

  if ind <temp
    # puts title.content
    arrMovies.push(title.content)
    # https://m.imdb.com/chart/top
    # arrLinks.push(link.content)
    puts 'https://m.imdb.com' + title['href']
    puts "hello"
    # puts link.content
  ind+=1
  end
 
  end
  thread.join
end

