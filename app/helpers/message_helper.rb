require "open-uri"
require 'uri'

module MessageHelper
  module YikYakApi
    
    def self.user_id
       "FCA4E90D-B4A7-468B-8F77-E8E576806C10"
    end
    
    def self.api_base_url
      "https://us-east-api.yikyakapi.net/api/"
    end

    def self.get_api_url(action)
      self.api_base_url + action
    end
    
    def self.message_url
      URI.parse(self.get_api_url("getMessage"))
    end
    def self.messages_url
      URI.parse(self.get_api_url("getMessages"))
    end
    def self.comment_url
      URI.parse(self.get_api_url("getComment"))
    end
    def self.comments_url
      URI.parse(self.get_api_url("getComments"))
    end    
  end
  
  module YikYak
    include YikYakApi
    
    def get_messages
      uri = YikYakApi.messages_url
      latitude = (session[:latitude]) ? session[:latitude] : "19.7974859"
      longitude = (session[:longitude]) ? session[:longitude] : "-70.6844876"
      puts "#{latitude} #{longitude}"
      params = {:userID=>YikYakApi.user_id,:userLat=>latitude,:userLong=>longitude}
      uri.query = URI.encode_www_form( params )
      JSON.parse(uri.open.read)["messages"] rescue []
    end
    
    def get_message(messageID)
      uri = YikYakApi.message_url
      params = {:userID=>YikYakApi.user_id,:messageID=>"R/#{messageID}"}
      uri.query = URI.encode_www_form( params )
      JSON.parse(uri.open.read)["messages"][0] rescue []
    end
        
    def get_comments(messageID)
      uri = YikYakApi.comments_url
      params = {:userID=>YikYakApi.user_id,:messageID=>"R/#{messageID}"}
      uri.query = URI.encode_www_form( params )
      comment_ids = JSON.parse(uri.open.read)["comments"]
    end
    
  end
  module View
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
