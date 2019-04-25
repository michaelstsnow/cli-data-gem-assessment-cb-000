class Scraper

	attr_accessor 

	def self.scrape_for_options(url)
		doc = Nokogiri::HTML.parse(open(url))
	end

end
