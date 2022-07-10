class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      redirect_to posts_path
    else
      flash[:alert] = 'Ошибка! Не удалось поставить лайк.'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    if @like.destroy
      redirect_to posts_path
    else
      flash[:alert] = 'Ошибка! Не удалось убрать лайк.'
    end
  end

  private

  def like_params
    params.permit :post_id
  end
end
