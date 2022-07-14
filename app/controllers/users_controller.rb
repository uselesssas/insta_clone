class UsersController < ApplicationController
  before_action :find_user, only: %i[show follow unfollow]

  def show
    @posts = @user.posts.includes(:photos, :comments, :likes, :bookmarks).order(created_at: :desc)
  end

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Данные обновлены.'
      redirect_to current_user
    else
      render :edit
    end
  end

  def follow
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :real_name, :website, :bio, :phone, :gender)
  end
end
