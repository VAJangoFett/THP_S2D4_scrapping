

require 'rubygems'
require 'nokogiri'
require 'open-uri'      

# fonction permettant d'obtenir tous les noms des députés (576)

def get_all_the_names(url)

	deputy_names = []

	page = Nokogiri::HTML(open(url))
	link_deputy_names = page.xpath("//*[@id=\"deputes-list\"]/div/ul/li/a")
	link_deputy_names.each do |names|
			deputy_names << names.text
		end
	return deputy_names
end

# fonction ressortant les urls de chaque fiche de député

def get_all_urls(url)

	deputy_urls_link = []

	page = Nokogiri::HTML(open(url))
	link_deputy_adress = page.xpath("//*[@id=\"deputes-list\"]/div/ul/li/a")
		
		link_deputy_adress.each do |anchor|
			deputy_urls_link << anchor["href"]
		end

		deputy_urls_link.map! do |url|
			url = "http://www2.assemblee-nationale.fr"+url
		end
	return deputy_urls_link
end

# fonction permettant d'assigné un mail à chaque député/url BLOQUÉ CAR EMAIL N'EST PAS UN ARRAY

# def get_each_mail_from_urls(url_link)

# 	page = Nokogiri::HTML(open(url_link))  
# 	email = page.xpath("//*[@id=\"haut-contenu-page\"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a")
# 	email.to_a
# 	puts email.class
# end 

def perform

result = {}
link = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

names = get_all_the_names(link)
urls = get_all_urls(link)

# test de la fonction avec une fiche de député au hasard
#puts get_each_mail_from_urls('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720764')

puts result = Hash[names.zip(urls)]

end


perform
