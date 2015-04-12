class LikesController < ApplicationController
  before_action :load_bookmark_and_like

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "Bookmark liked."
      redirect_to bookmarks_path
    else
      flash[:error] = "Please try again later."
      redirect_to bookmarks_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = Like.find(params[:id])
    authorize @like
    if @like.destroy
      flash[:notice] = "Like deleted."
      redirect_to topic_bookmark_path
    else
      flash[:error] = "Please try again later."
      redirect_to topic_bookmark_path
    end
  end

  private

  def load_bookmark_and_like
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = @bookmark.likes.where(user_id: current_user.id).first
  end
end
