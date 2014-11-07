class ServiceController < ApplicationController
  before_action :set_yak, only: [:upvote,:downvote]
  include YikYak::API
  
  def upvote
    @yak = yak_action(@yak_id, Assets.upvote_yak) if @type == "message"
    @yak = yak_action(@yak_id, Assets.upvote_comment) if @type == "comment"
  end

  def downvote
    @yak = yak_action(@yak_id, Assets.downvote_yak) if @type == "message"
    @yak = yak_action(@yak_id, Assets.downvote_comment) if @type == "comment"
  end

  private 
  def set_yak
    @yak_id = params[:yak]
    @type = params[:type]
  end
end

