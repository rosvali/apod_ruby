# frozen_string_literal: true
require 'bundler'
Bundler.require

require_relative 'lib/scraping'

def apod_ruby(option = ARGV[0])
	if option && option.to_i != 0 && option.to_s.length == 6
		Scraping.new.scraping_picture(option)
	elsif option == 'url'
		Scraping.new.print_url(date = ARGV[1])
	else
		Scraping.new.scraping_picture
	end
end

apod_ruby
