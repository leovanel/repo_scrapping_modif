require 'rubygems'
require 'nokogiri'
require 'open-uri'

def page_index
    index_lien= Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    return index_lien
end
   
def scrap_mairie

    index_lien = page_index

    mairie = index_lien.xpath("//a[@class='lientxt']")
    nb = mairie.size
    tab_mairie = []
    i=0
    email= []
    pagemail= []
    url=[]
    pagemairie=[]
    nommairie=[]
    tab_final=[]
    
    nb.times do 
        tab_mairie[i] = mairie[i]["href"][1..-1]
        pagemairie = index_lien.xpath("//a[@class='lientxt']")
        nommairie[i]= pagemairie[i].text

        url[i] = "http://annuaire-des-mairies.com#{tab_mairie[i]}"
        page_lien = Nokogiri::HTML(open("#{url[i]}"))
               
        pagemail[i]= page_lien.xpath("//*[contains(text(), '@')]")
        email[i]=pagemail[i].text

        mairie_hash = Hash.new
        mairie_hash[nommairie[i]]= email[i]
        tab_final << mairie_hash
        
       
        i=i+1
    end
    

    return tab_final
end

scrap_mairie





    