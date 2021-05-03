require 'open-uri'
require 'nokogiri'

class Scraper
  def search(ingredient)
    results = []
    url = "https://www.allrecipes.com/search/results/?search=#{ingredient}"
    doc = Nokogiri::HTML(URI.open(url), nil, 'utf-8')
    doc.search(".card__detailsContainer").first(5).each do |card|
      name = card.search('.card__title').text.strip
      description = card.search('.card__summary').text.strip
      rating_list = card.search('.review-star-text').text.strip
      stars = rating_list.split(":") unless rating_list.nil?
      results << Recipe.new({name: name, description: description, rating: stars[1], prep_time: rand(1..30)})
    end
    return results
  end
end