class FollowersController < ApplicationController
  before_action :find_user

  def followers
    @followers = @user.followers
  end

  def followings
    @followings = @user.followees
  end

  def find_user
    @user = User.find(params[:id])
  end
end
