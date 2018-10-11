
require 'rubygems'
require 'nokogiri'
require 'open-uri' 

# trouve les noms des cryptos

def get_crypto_name(url)

	crytpo_names = []

	page = Nokogiri::HTML(open(url))
	page_link_names = page.css("a.currency-name-container.link-secondary")
		page_link_names.each do |name|
			crytpo_names << name.text
		end
	return crytpo_names
end

# trouve les valeurs des cryptos

def get_crypto_value(url)

	crypto_value = []

	page = Nokogiri::HTML(open(url))
	page_link_price = page.css("a.price")
		page_link_price.each do |value|
			crypto_value << value["data-usd"]
		end
	return crypto_value
end


def perform

		while(true)

			link = "https://coinmarketcap.com/all/views/all/"
			result = {}

			names = get_crypto_name(link)
			values = get_crypto_value(link)

			result = Hash[names.zip(values)]

			result.each do |crypto, market_value|
			puts "La crypto #{crypto} a une valeur de $#{market_value}"
			end
			
			sleep(3600)

		end

end

perform