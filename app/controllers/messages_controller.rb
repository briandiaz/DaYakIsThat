class MessagesController < ApplicationController
  include YikYak::API
  include MessageHelper::View
  include ApplicationHelper
  before_action :set_yak, only: [:show]
  
  def show
    @yak_message, @yak_comments = get_message(@yak_id), get_comments(@yak_id)
  end
  
  def index
    @yak_messages = get_messages()
  end
  
  def my_tops
    @yak_messages = get_my_tops()
  end
  
  def set_client_lat_long
    set_latitude_longitude(params[:latitude],params[:longitude])
  end
  
  private
  
  def set_yak
    @yak_id = params[:id]
  end
  
end
