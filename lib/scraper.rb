class Scraper

	attr_accessor 

	def get_options(url)
		doc = Nokogiri::HTML(open(url))
	end

end
