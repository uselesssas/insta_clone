class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to current_user
      flash[:notice] = 'Данные обновлены.'
    else
      render :edit
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  private

  def user_params
    params.require(:user).permit(:username, :real_name, :website, :bio, :phone, :gender, :follower_id, :followee_id)
  end
end
