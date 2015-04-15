class IncomingController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create]

  def create
    #puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by(email: params[:sender])
    
    if @user.nil? || @user.pending_invite?
      User.invite!(email: params[:sender], name: params[:sender])
     
    else 
      @topic = Topic.find_or_create_by(title: params[:subject])
      @url = params["stripped-text"]
      @bookmark = Bookmark.new(user: @user, topic: @topic, url: @url)
      authorize @bookmark
      @bookmark.save
    end
    head 200
  end

end