class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    new_favorite = current_user.favorites.new(post_image_id: post_image.id)
    new_favorite.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    destroy_favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    destroy_favorite.destroy
    redirect_to post_image_path(post_image)
  end
  
end
