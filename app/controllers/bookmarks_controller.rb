class BookmarksController < ApplicationController
  def index
  	@topics = Topic.all
  	@user = current_user
  	@bookmark = Bookmark.where(params[user_id: current_user.id]).first || Bookmark.where(params[:topic_id]).first  	
  end

  def show
  	@topic = Topic.where(params[:topic_id])
  	@bookmark = Bookmark.find(params[:id])
  end

  def new
  end

  def create
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.build(bookmark_params)
  	@bookmark.user = current_user

  	if @bookmark.save
  		flash[:notice] = "Bookmark was saved"
  	else
  		flash[:error] = "Bookmark did not save. Please try again."
  	end
  	redirect_to @topic
  end

  def edit
  end

  private

  def bookmark_params
  	params.require(:bookmark).permit(:url)
  end
end
