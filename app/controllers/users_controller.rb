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

  private

  def user_params
    params.require(:user).permit(:username, :real_name, :website, :bio, :phone, :gender)
  end
end
