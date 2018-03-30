class CrawlController < ApplicationController

    def upload
        require('nokogiri')
        seochon = Nokogiri::XML(File.open("public/seochon.xml"))
        seochon.xpath("//store").each do |each_data|
            cd = CrawlDatum.new
            cd.category = each_data.xpath("category").inner_text
            cd.name = each_data.xpath("name").inner_text
            cd.address = each_data.xpath("address").inner_text
            cd.tags = each_data.xpath("tags").inner_text
            cd.is_inside = each_data.xpath("is_inside").inner_text
            cd.is_food_traditional = each_data.xpath("is_food_traditional").inner_text
            cd.is_look_traditional = each_data.xpath("is_look_traditional").inner_text
            cd.near_subway = each_data.xpath("near_subway").inner_text
            cd.save
        end
        redirect_to '/crawl/chk'
    end

    def upload2
        unless CrawlDatum.where(address: params[:address_name]).take == true
            cd_saved = CrawlDatum.where(address: params[:address_name]).take
            puts params[:x]
            cd_saved.x = params[:x]
            cd_saved.y = params[:y]
            cd_saved.save
        end
    end
    
    def marker2
        @cdchk = CrawlDatum.all
    end

    def chk
        @cdchk = CrawlDatum.all
    end

    def marker
        @cdchk = CrawlDatum.all
    end

end
