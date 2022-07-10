class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.includes(:photos, :user).order('created_at desc')
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
      flash[:alert] = 'Пост НЕ сохранён.'
      redirect_to posts_path
    end
  end

  def show
    @posts = @post.photos
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]
    return if @post

    flash[:danger] = 'Пост НЕ найден'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :description
  end
end
