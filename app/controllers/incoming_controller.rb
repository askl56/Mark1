class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    @user = User.where(:email => params[:sender]).first
    # Find the topic by using params[:subject]
    @topic = Topic.where(:email => params[:subject]).first
    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    @user = User.create(email: params[:sender], password: "#{params[:title]_blocmarks}") if @user.nil?
    # Check if the topic is nil, if so, create and save a new topic
    @topic = Topic.create(title: params[:title], user_id: @user.id) if @topic.nil?
    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = Bookmark.create(url: @url, topic_id: @topic_id)
    # Assuming all went well.s
    authorize @bookmark

    if @user.nil?
      User.invite!(email: params[:sender], name: params[:sender])
    end
    head 200
  end
end
