class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "Bookmark liked."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error] = "Please try again later."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = @bookmark.likes.find(params[:id]
    if @like.destroy
      flash[:notice] = "Like deleted."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error] = "Please try again later."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

end