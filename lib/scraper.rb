class Scraper

	attr_accessor 

	def self.scrape_for_options(url)
		doc = Nokogiri::HTML.parse(open(url))
		all_options_house = doc.css('div.controls')
		options = all_options_house.css('select option')
		### Need to figure out the proper selectors on this website

	end

end
