class MainController < ApplicationController
  respond_to :html, :json
  require 'mechanize'
  require 'nokogiri'
  
  def index
    
  end
  
  def lunch_dinner_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/menu/lunch-dining/")
    @page_title = page.title
    @doc = page.parser
    @starter_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @soup_salad_menu = @doc.css('//div#tabs-1//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
   
    @sandwhich_menu = @doc.css('//div#tabs-2//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @entrees_menu = @doc.css('//div#tabs-3//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @sides_menu = @doc.css('//div#tabs-4//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @temptations_menu = @doc.css('//div#tabs-5//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    
    
    respond_with do |format|
      format.json { render :json =>{starters: @starter_menu, 
                                    soup_salad: @soup_salad_menu, 
                                    sandwhiches: @sandwhich_menu,
                                    entrees: @entrees_menu,
                                    sides: @sides_menu,
                                    temptations: @temptations_menu}}
    end
  end
  
  def brunch_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/menu/brunch/")
    @page_title = page.title
    @doc = page.parser
    @entrees_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @alacarte_menu = @doc.css('//div#tabs-1//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
   
    respond_with do |format|
      format.json { render :json =>{entrees: @entrees_menu, 
                                    alacarte: @alacarte_menu, 
        }}
    end
  end

  def vegan_gf_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/menu/vegan-gf/")
    @page_title = page.title
    @doc = page.parser
    @vegan_gf_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
   
    respond_with do |format|
      format.json { render :json =>{vegan_gf:  @vegan_gf_menu, 
        }}
    end
  end
  
  def lunch_specials_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/menu/lunch-specials/")
    @page_title = page.title
    @doc = page.parser
    
    @heading_text = @doc.css('//div.post-84//p').first.try(:text)
    
    @sandwiches_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @soup_menu = @doc.css('//div#tabs-1//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @greens_menu = @doc.css('//div#tabs-2//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
   
    respond_with do |format|
      format.json { render :json =>{heading: @heading_text,
                                    sandwiches: @sandwiches_menu, 
                                    soups: @soup_menu, 
                                    greens: @greens_menu,
        }}
    end
  end
  
  def beer_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/drinks/beer/")
    @page_title = page.title
    @doc = page.parser
    @bottled_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @bottled_750ml_menu = @doc.css('//div#tabs-1//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
   
    respond_with do |format|
      format.json { render :json =>{bottled:  @bottled_menu,
        bottled_750ml_menu: @bottled_750ml_menu,
        }}
    end
  end
  
  def drink_specials
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/drinks/drink-specials/")
    @page_title = page.title
    @doc = page.parser
    @specials = @doc.css('//div.post-200').to_s
   
    respond_with do |format|
      format.json { render :json =>{specials:  @specials, 
        }}
    end
  end
  
  def specialties_menu
    agent = Mechanize.new
    page = agent.get(" http://speakezlounge.com/drinks/specialties/")
    @page_title = page.title
    @doc = page.parser
    @cocktail_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    respond_with do |format|
      format.json { render :json =>{cocktails:  @cocktail_menu,
        }}
    end
  end
  
  def wine_menu
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/drinks/wine/")
    @page_title = page.title
    @doc = page.parser
    @white_menu = @doc.css('//div#tabs-0//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    @red_menu = @doc.css('//div#tabs-1//div.mm-menu-item-wrap').map do |item|
      {
        :name => item.at_css('.mm-menu-item-name').try(:text),
        :description => item.at_css('p').try(:text),
        :prices => item.css('.price-variant').map do |price|
        {
          :price => price.try(:text)
          
        }
        end
      }  
    end
    
    respond_with do |format|
      format.json { render :json =>{white_wines:  @white_menu,
                                    red_wines: @red_menu,
        }}
    end
  end
  
  def media
    agent = Mechanize.new
    page = agent.get("http://speakezlounge.com/media/")
    @page_title = page.title
    @doc = page.parser
    
    @media_albums = @doc.css('//div.post-29//p').map do |item|
      {
        :name => item.css('a').attr('title').try(:text),
        :image => item.css('img').attr('src').try(:text),
        :link => item.css('a').attr('href').try(:text).gsub("http://speakezlounge.com/media", "").gsub(/\//, "")     
      }  
    end
    
    respond_with do |format|
      format.json { render :json =>{albums:  @media_albums, 
        }}
    end
  end
  
  def album
    
    if params['id'].present?
      @album_id = params['id']
    else
      @album_id = ""
    end
    
    agent = Mechanize.new
    url = "http://speakezlounge.com/media/"+@album_id
    page = agent.get(url)
    @page_title = page.title
    @doc = page.parser
    
    @images = @doc.css('dt').map do |item|
      {
        :thumb_image => item.css('img').attr('src').try(:text),
        :image_link => item.css('img').attr('src').try(:text).gsub("-150x150", ""),
        
      }  
    end
    
    respond_with do |format|
      format.json { render :json =>{album_title: @page_title, images:  @images, 
        }}
    end
  end
  
   
  def about
  end

  def menu
      
    
    
  end
end
