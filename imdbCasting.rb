require 'nokogiri'
require 'open-uri'
require 'net/http'

class Movie
  attr_accessor :title, :cast

  def initialize(title, cast)
    @title = title
    @cast = cast
  end

  def to_s
    "#{title} - Cast: #{cast.join(', ')}"
  end
end

class IMDBKnowledgeBase
  def initialize(limit)
    @limit = limit
    @movies = []
  end

  def fetch_movie_cast(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    doc = Nokogiri::HTML(response.body)
    cast = []

    doc.css('a.sc-bfec09a1-1.fUguci').each do |actor|
      cast << actor.text.gsub(/\(|\)/, '').split(',')
    end

    cast
  end

  def fetch_top_movies
    uri_base = URI.parse("https://m.imdb.com")

    uri = URI.parse("https://m.imdb.com/chart/top")
    request = Net::HTTP::Get.new(uri)
    request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'

    response = Net::HTTP.start(uri_base.host, uri_base.port, use_ssl: true) do |http|
      http.request(request)
    end

    doc = Nokogiri::HTML(response.body)
    movie_elements = doc.css('a.ipc-title-link-wrapper')

    threads = []

    movie_elements.take(@limit).each do |element|
      title = element.content
      url = 'https://m.imdb.com' + element['href']

      threads << Thread.new do
        cast = fetch_movie_cast(url)
        @movies << Movie.new(title, cast)
      end
    end

    threads.each(&:join)
  end

  def display_movies
    @movies.each_with_index do |movie, index|
      puts "#{index + 1}. #{movie}"
    end
  end
end

print "Enter the number of top movies to fetch: "
n = gets.chomp.to_i

knowledge_base = IMDBKnowledgeBase.new(n)
knowledge_base.fetch_top_movies
knowledge_base.display_movies
