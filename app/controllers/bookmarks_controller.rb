class BookmarksController < ApplicationController
  before_action :find_list
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
