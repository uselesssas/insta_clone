class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.order(created_at: :desc)
    # @posts = Post.all.includes(:photos, :user, :likes).order('created_at desc')
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      params[:images]&.each do |img|
        @post.photos.create(image: img)
      end
      redirect_to posts_path
      flash[:notice] = 'Пост сохранён.'
    else
      flash[:alert] = 'Ошибка! Не удалось сохранить пост.'
      redirect_to posts_path
    end
  end

  def show
    @posts = @post.photos
    @likes = @post.likes.includes(:user)
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = 'Пост удалён.'
      else
        flash[:alert] = 'Ошибка! Не удалось удалить пост.'
      end
    else
      flash[:alert] = 'Ошибка! У Вас недостаточно прав.'
    end
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]
    return if @post

    flash[:danger] = 'Пост НЕ найден'
    redirect_to root_path, info: 'deleted', status: :see_other
  end

  def post_params
    params.require(:post).permit(:description)
  end
end
