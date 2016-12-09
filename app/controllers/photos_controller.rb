class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy, :show]

  def index
    @photos = Photo.all.order(updated_at: :desc)
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
    unless @photo.user_id == current_user.id
      redirect_to root_path, notice: "自分の投稿以外は編集できません！"
    end
  end

  def update
    if @photo.user_id == current_user.id
      @photo.update(photos_params)
      redirect_to photos_path
    end
  end

  def destroy
    if @photo.user_id == current_user.id
      @photo.destroy
      redirect_to photos_path
    end
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
