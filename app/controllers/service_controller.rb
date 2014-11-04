class ServiceController < ApplicationController
  before_action :set_yak, only: [:upvote,:downvote]
  include MessageHelper::YikYak
  
  def upvote
    yak_action(@yak_id, YikYakApi.upvote_yak) if @type == "message"
    yak_action(@yak_id, YikYakApi.upvote_comment) if @type == "comment"
  end

  def downvote
    yak_action(@yak_id, YikYakApi.downvote_yak) if @type == "message"
    yak_action(@yak_id, YikYakApi.downvote_comment) if @type == "comment"
  end

  private 
  def set_yak
    @yak_id = params[:yak]
    @type = params[:type]
  end
end

