require 'nokogiri'
require 'open-uri'

class Scraping

	def get_date
		date = Time.now.strftime("%y%m%d")
	end

	def scraping_picture(date = get_date)
		page = Nokogiri::HTML(URI.open("https://apod.nasa.gov/apod/ap#{date}.html"))
		url_picture = page.css('/html/body/center[1]/p[3]/a').attribute('href')
		page_picture = "https://apod.nasa.gov/apod/#{url_picture}"

		system("curl #{page_picture} > ~/desktop/desktop_picture#{date}.jpg")
	end

	def print_url(date = get_date)
		puts "https://apod.nasa.gov/apod/ap#{date}.html"
	end
end
