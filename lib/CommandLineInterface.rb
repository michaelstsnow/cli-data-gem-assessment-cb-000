require_relative "../lib/scraper.rb"
require_relative "../lib/company.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'

class CommandLineInterface
	# Defining the constants
    YComboBase="https://www.ycombinator.com/companies/"
    All_Batches=["All Batches","w2019","s2018","w2018","s2017","w2017","s2016","w2016","s2015","w2015","s2014","w2014","s2013","w2013","s2012","w2012","s2011","w2011","s2010","w2010","s2009","w2009","s2008","w2008","s2007","w2007","s2006","w2006","s2005"]
    All_Categories=["All categories","Artificial Intelligence","Augmented Reality","B2B","Biomedical","Biotech","Community","Consumer","Developer Tools","Diversity","Drones","Education","Energy","Enterprise","Entertainment","Fintech","Government","Hardware","Healthcare","Marketplace","Media","Other","Robotics","Science","Security","Transportation","Virtual Reality"]
    All_Female_Team=false
    Female_Founder=false
    
    attr_accessor :number_of_criteria, :number_of_options, :selected_option
    attr_reader :selected_options

	def run
		#greet the user with some helpful info
		#let them know what the program does
		puts "Hello There! \nThis program helps walk you through scraping the YCombinators website of companies that they have invested in. You also have the ability to specify the companies that you scrape by entering your own criteria. Let's get started!\nYou have the following optiont available to you:"
		request_valid_number_of_criteria("start")
		@selected_options = [] 
		request_options
			#Build final URL to scrape the site
			#scape the website for companies based on their input and store
		#return the list of companies or a message of there are no companies in their search criteria 

		#set_final_url
		#get_companies
		#display_companies
	end

	def display_options
		puts "1. Batches (All Batches or w2019 or s2018...s2005)"
		puts "2. Categories (All, Artificial Intelligence...)"
		puts "3. All Female Team?"
		puts "4. Female Founder?"
	end

	def request_valid_number_of_criteria(cycle)
		if cycle == "start"
			#this is the first loop of the cycle ask them the number of criteria they want to use
			display_options
			puts "Of the above optiont how many of them would you like to filter your final company list by?"
			@number_of_options=gets.chomp
			if valid_number_of_options?
				request_valid_number_of_criteria("valid")
			else
				@valid_number_of_options=nil
				request_valid_number_of_criteria("invalid")
			end
		elsif cycle == "valid"
			#their previous entry was valid continue - 
			# in here I would want to do a while loop until i fill the number of options up 
			puts "Excellent - that's the same number of filters I was thinking - Let's continue!"
		elsif cycle == "invalid"
			puts "That was an invalid number of options please select again"
			request_valid_number_of_criteria("start")
		else
		end
	end

	def valid_number_of_options?
		if @number_of_options.to_i >=0 && @number_of_options.to_i <= 4 
			return true
		else
			return false
		end
	end


	def request_options
		#the number of criteria could be any number 0-4
		if @number_of_options == 0
			#just scrape the normal URL 
			puts "Since we are going to scrape the standard Ycombinator site of all companies there you can not sit back and watch as they come rolling in"
			######### IS THIS THE BEST WAY TO CALL THE SCRAPER? 
			#this_scraper=Scraper.new
			#this_scraper.scrape_for_options(YComboBase)
		elsif 
			#we will need to ask them which options they want to include until they have selected the same number of options as are available 
			until @number_of_options.to_i == @selected_options.size
				puts "This is the number of options you want to screen for: #{@number_of_options}"
				puts "This is the number of options you have selected: #{@selected_options.size}"
				puts "Of the below options which number option would you like to be used in your screen of the YCombinators website?"
				display_options
				@selected_option=gets.chomp
				if valid_option?
					@selected_options << @selected_option.to_i
					puts "Great selection! Let's continue"
				else
					puts "Sorry that was an invalid selection"
				end

			end
		end
	end


	def valid_option?
		if @selected_option.to_i >=1 && @selected_option.to_i <= 4
			if @selected_options.include?(@selected_option.to_i)
				return false
			else
				return true
			end
		else
			return false
		end
	end


end

CommandLineInterface.new.run