class ServiceController < ApplicationController
  before_action :set_yak, only: [:upvote,:downvote]
  include YikYak::API
  include YikYak::Assets
  
  def upvote
    @yak = yak_action(@yak_id,  YikYak::Assets.upvote_yak) if @type == "message"
    @yak = yak_action(@yak_id,  YikYak::Assets.upvote_comment) if @type == "comment"
  end

  def downvote
    @yak = yak_action(@yak_id, YikYak::Assets.downvote_yak) if @type == "message"
    @yak = yak_action(@yak_id, YikYak::Assets.downvote_comment) if @type == "comment"
  end

  private 
  def set_yak
    @yak_id = params[:yak]
    @type = params[:type]
    print "ID: R/#{@yak_id}   Type: #{@type}\r\n"
  end
end

