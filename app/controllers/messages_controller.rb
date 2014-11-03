class MessagesController < ApplicationController
  include MessageHelper::YikYak
  include MessageHelper::View
  include ApplicationHelper
  
  def show
    yak_id = params[:id]
    @yak_message = get_message(yak_id)
    @yak_comments = get_comments(yak_id)
  end
  
  def index
    @yak_messages = get_messages()
  end
  
  def set_client_lat_long
    set_latitude_longitude(params[:latitude],params[:longitude])
  end
  
end
