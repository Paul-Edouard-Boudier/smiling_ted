class ChaptersController < ApplicationController
  before_action :set_ted, only: [:show, :new, :create]
  skip_before_action :authenticate_user!, only: :show

  def show
    @chapter = Chapter.find(params[:id])
    @chapter_coordinates = { lat: @chapter.latitude, lng: @chapter.longitude }
  end

  def new
    @user = current_user
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.ted = @ted
    @chapter.user = current_user
    @chapter.save
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def chapter_params
    params
    .require(:chapter)
    .permit(
      :description,
      :localisation,
      :likes,
      photos_attributes: [
        :id,
        :description,
        :title,
        :image,
        :_destroy
      ])
  end

  def set_ted
    @ted = Ted.find(params[:ted_id])
  end

end
