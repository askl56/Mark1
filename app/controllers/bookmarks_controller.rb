class BookmarksController < ApplicationController
  
  def index
  	@topics = Topic.all
  	@user = current_user
  	@bookmarks = current_user.bookmarks 	
  end

  def create
  	@topic = Topic.friendly.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.build(bookmark_params)
  	@bookmark.user = current_user

  	if @bookmark.save
  		flash[:notice] = "Bookmark was saved"
  	else
  		flash[:error] = "Bookmark did not save. Please try again."
  	end
  	redirect_to @topic
  end

  private

  def bookmark_params
  	params.require(:bookmark).permit(:url)
  end
end
