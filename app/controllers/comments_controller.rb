class CommentsController < ApplicationController
  def index
    @comments = @post.comments.includes(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @post = @comment.post
      redirect_to root_path
    else
      flash[:alert] = 'Ошибка! Не удалось оставить комментарий.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to root_path
    else
      flash[:alert] = 'Ошибка! Не удалось удалить комментарий.'
    end
  end

  private

  def comment_params
    params.required(:comment).permit(:user_id, :post_id, :body)
  end
end
