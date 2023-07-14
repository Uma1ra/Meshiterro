class PostImagesController < ApplicationController

  def new
    @post_new_image = PostImage.new
  end

  def create
    @post_new_image = PostImage.new(post_image_params)
    @post_new_image.user_id = current_user.id
    
    if @post_new_image.save
      redirect_to post_image_path(@post_new_image.id)
    else
      render :new
    end
  end

  def index
    @post_index_images = PostImage.page(params[:page])
  end

  def show
    @show_post_image = PostImage.find(params[:id])
    @post_new_comment = PostComment.new
  end
  
  def destroy
    destroy_post_image = PostImage.find(params[:id])
    destroy_post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
