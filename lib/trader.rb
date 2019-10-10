require 'rubygems'
require 'nokogiri'
require 'open-uri'


def lien
    page_lien = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    return page_lien
end

def scrapping_values
    page = lien
    i=0

    crypto_values = page.xpath("//a[@class='price']") 
    crypto_id = page.xpath("//a[@class='currency-name-container link-secondary']" ) 
    nbr = crypto_id.size
    crypto_values_float = []
    nbr.times do
        crypto_values_float[i]= crypto_values[i].text
        i=i+1
    end
    crypto_values_float.map!{|str| str[1..-1].to_f.round(2)}
    tab = []
    
    a=0
    
    nbr.times do
        
        crypto_hash = Hash.new
        crypto_hash[crypto_id[a].text]= crypto_values_float[a] 
        tab<<crypto_hash  
        a=a+1
    end
   
    
    return tab

end


scrapping_values