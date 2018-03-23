class CrawlController < ApplicationController

    def upload
        require('nokogiri')
        seochon = Nokogiri::XML(File.open("public/seochon.xml"))
        seochon.xpath("//store").each do |each_data|
            cd = CrawlDatum.new
            cd.category = each_dat  a.xpath("//category")
            cd.name = each_data.xpath("//name")
            cd.address = each_data.xpath("//address")
            cd.tags = each_data.xpath("//tags")
            cd.is_inside = each_data.xpath("//is_inside")
            cd.is_food_traditional = each_data.xpath("//is_food_traditional")
            cd.is_look_traditional = each_data.xpath("//is_look_traditional")
            cd.near_subway = each_data.xpath("//near_subway")
            cd.save
        end
    end

end
