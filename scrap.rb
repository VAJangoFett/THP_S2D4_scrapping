

require 'rubygems'
require 'nokogiri'
require 'open-uri'      



page = Nokogiri::HTML(open("https://www.thehackingproject.org/dashboard/weeks/2/days/4"))   
puts page.class 
