class UsersController < ApplicationController
  def show
    @show_user = User.find(params[:id])
    @user_post_images = @show_user.post_images
  end

  def edit
    @edit_user = User.find(params[:id])
  end
end
