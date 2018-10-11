

require 'rubygems'
require 'nokogiri'
require 'open-uri'      

# Recup les adresse url des différentes mairies

def get_all_the_urls_of_val_doise_townhalls

	val_doise_townhall = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	liens_mairie = {}

	anchors_mairie = val_doise_townhall.css("a")

	anchors_mairie.map do |anchor|
		if anchor["href"] =~ (/95/)
			liens_mairie[anchor.text] = anchor["href"]
		end
	end

	liens_mairie.map do |townhall_name, townhall_url|
		townhall_url[0] = "http://annuaire-des-mairies.com"
	end
	return liens_mairie
end

# recup sur les pages des différentes mairies les adresses mails


def get_the_email_of_a_townhall_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))  
	adresse_mairie = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	return adresse_mairie.text
end


def perform
	result = {}
	get_all_the_urls_of_val_doise_townhalls.each do |townhall_name, townhall_url|
		result[townhall_name] = get_the_email_of_a_townhall_from_its_webpage(townhall_url)
	end

	puts result

end

perform