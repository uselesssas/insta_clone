class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.includes(:user, :photos, :comments, :likes, :bookmarks).order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if params[:images].to_a.count > 3
      flash[:alert] = 'Ошибка! Слишком много фотографий, можно загрузить максимум 3 фотографии в одном посте.'
    elsif params[:images]
      if @post.save
        params[:images].each do |img|
          @post.photos.create(image: img)
        end
        flash[:notice] = 'Пост сохранён.'
      else
        flash[:alert] = 'Ошибка! Не удалось сохранить пост.'
      end
    else
      flash[:alert] = 'Ошибка! Пожалуйста, добавьте одну или несколько фотографий к посту.'
    end

    redirect_to posts_path
  end

  def show
    @posts = @post.photos
    # @likes = @post.likes.includes(:user)
    @likes = @post.likes.all
    @comment = Comment.new
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
    redirect_to root_path, info: 'Пост удалён.', status: :see_other
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description)
  end
end
