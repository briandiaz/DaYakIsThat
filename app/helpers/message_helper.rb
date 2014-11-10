require "open-uri"
require 'uri'

module MessageHelper
  module View
    def self.is_disabled(yak)
      'disabled="disabled"'.html_safe if yak['liked'] != 0
    end
    
    def self.get_iframe_vidme(yak)
      vidme = "https://" + self.get_vidme_from_yak(yak)
      '<iframe class="embed-responsive-item" src="'+vidme+'" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no"></iframe>'
    end
    
    def self.contains_vidme(yak)
      (self.get_vidme_from_yak(yak).length > 0)
    end
    
    def self.get_vidme_from_yak(yak)
      yak.match(/vid(.*)me\/[a-zA-Z0-9]+/).to_s.gsub(/[ ]/,"").gsub(/.me\//,".me/e/")
    end
    
    def self.get_likes_color(likes)
      case likes.to_i
        when 0 then "info"
        when -3..0 then "warning"
        when -10..-3 then "danger"
        when 0..1000 then "primary"
        else "danger"
      end
      rescue "danger"
    end  
    
    def self.thumbs(likes)
      (likes >= 0) ? "up" : "down"
    end   
    
    def self.glyphicon_thumbs(likes)
      "glyphicon glyphicon-thumbs-" + self.thumbs(likes)
    end
    
    def self.convert_timestamp(yak)
      (DateTime.parse(yak['time']).to_time + 5.hours).to_i
    end
    
    def self.convert_date(yak)
      date = DateTime.parse(yak['time'])
      date += 1.hours
      date.strftime("%m/%d/%Y %H:%M")
    end
    
    
    
  end
end
