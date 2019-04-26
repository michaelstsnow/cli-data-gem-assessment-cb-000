require_relative "../lib/scraper.rb"
require_relative "../lib/scraper_options.rb"
require_relative "../lib/company.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'

class CommandLineInterface

	#This Is the overall flow of the code and will be ogiginally mapped out in comments

	#I trigger the program
		# The program srapes the website for the available options and stores them  -> turns out that this is not as easy as I thought since it is a react portion of the website and instead will have to use constants
	# Program asks me what options I want to scrape the website for
		# The program displays each option 1 by one and asking if I want to filter by it Y/N 
		# I provide my selection for various options
	# Scraper scrapes the website with my options as added filters on the website appended to base url 	
	# Scraper returns the companies that fit my options or a message saying if there are no companies try adjusting my criteria 

    YComboBase="https://www.ycombinator.com/companies/"
    All_Batches=["All Batches","w2019","s2018","w2018","s2017","w2017","s2016","w2016","s2015","w2015","s2014","w2014","s2013","w2013","s2012","w2012","s2011","w2011","s2010","w2010","s2009","w2009","s2008","w2008","s2007","w2007","s2006","w2006","s2005"]
    All_Categories=["All categories","Artificial Intelligence","Augmented Reality","B2B","Biomedical","Biotech","Community","Consumer","Developer Tools","Diversity","Drones","Education","Energy","Enterprise","Entertainment","Fintech","Government","Hardware","Healthcare","Marketplace","Media","Other","Robotics","Science","Security","Transportation","Virtual Reality"]
    All_Female_Team=false
    Female_Founder=false


	def run
		#puts "Hello There! \n this program helps walk you through scraping the YCombinators website of companies that they have invested in \n you also have the ability to specify the companies that you scrape by entering your own criteria. Let's get started!"
		#greet the user with some helpful info
		#let them know what the program does
		#ask which options they would like to move forward with?
			#Build final URL to scrape the site
			#scape the website for companies based on their input and store
		#return the list of companies or a message of there are no companies in their search criteria 

		set_final_url
		get_companies
		display_companies
	end

	def get_options(url)
		options=Scraper.scrape_for_options(url)
	end



end

CommandLineInterface.new.run