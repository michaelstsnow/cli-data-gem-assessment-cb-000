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
		# The program srapes the website for the available options and stores them 
	# Program asks me what options I want to scrape the website for
		# The program displays each option 1 by one and asking if I want to filter by it Y/N 
		# I provide my selection for various options
	# Scraper scrapes the website with my options as added filters on the website appended to base url 	
	# Scraper returns the companies that fit my options or a message saying if there are no companies try adjusting my criteria 

    YComboBase="https://www.ycombinator.com/companies/"

	def run
		get_options(YComboBase)
		set_final_url
		get_companies
		display_companies
	end

	def get_options(url)
		options=Scraper.scrape_for_options(url)
	end



end

CommandLineInterface.new.run