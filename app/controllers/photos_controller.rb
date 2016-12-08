class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photos_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @photo.update(photos_params)
    redirect_to photos_path
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  def show
  end

  private
  def photos_params
    params.require(:photo).permit(:title, :content, :picture)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
