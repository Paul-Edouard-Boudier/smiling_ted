class PhotosController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, photo: [])
  end

end
