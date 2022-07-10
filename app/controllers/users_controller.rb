class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :real_name, :website, :bio, :phone, :gender)
  end
end
