require "open-uri"
require 'uri'

module MessageHelper
  module View
    def self.is_disabled(yak)
      'disabled="disabled"'.html_safe if yak['liked'] != 0
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
  end
end
