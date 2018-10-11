

require 'rubygems'
require 'nokogiri'
require 'open-uri'      




def get_name(url)

	deputy_names = []

	page = Nokogiri::HTML(open(url))
	link_deputy_names = page.css("span.list_nom")
	link_deputy_names.each do |name|
		deputy_names << name.text
	end
	return deputy_names
end





def perform

link = "https://www.nosdeputes.fr/deputes"

puts get_name(link)

end


perform