class PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def photo_params
  params.require(:photo).permit(:title, :description, :photo)
end

end
