class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @show_user = User.find(params[:id])
    @user_post_images = @show_user.post_images.page(params[:page])
  end

  def edit
    @edit_user = User.find(params[:id])
  end
  
  def update
    @edit_user = User.find(params[:id])
    @edit_user.update (user_params)
    redirect_to user_path(@edit_user.id)
  end
  
  private
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
