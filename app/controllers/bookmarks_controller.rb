class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      @post = @bookmark.post
      redirect_to posts_path
    else
      flash[:alert] = 'Ошибка! Не удалось поставить лайк.'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post
    if @bookmark.destroy
      redirect_to posts_path, info: 'Лайк убран.', status: :see_other
    else
      flash[:alert] = 'Ошибка! Не удалось убрать лайк.'
    end
  end

  private

  def bookmark_params
    params.permit :user_id, :post_id
  end
end
