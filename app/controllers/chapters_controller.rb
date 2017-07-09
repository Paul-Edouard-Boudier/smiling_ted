class ChaptersController < ApplicationController
  before_action :set_ted, only: [:show, :new, :create]
  skip_before_action :authenticate_user!, only: :show

  def show
    @chapter = Chapter.find(params[:id])
    authorize @chapter
    @chapter_coordinates = { lat: @chapter.latitude, lng: @chapter.longitude }
  end

  def new
    @user = current_user
    @chapter = Chapter.new
    authorize @chapter
  end

  def create
    @chapter = Chapter.new(chapter_params)
    authorized @chapter
    @chapter.ted = @ted
    @chapter.user = current_user
    if @chapter.save
      redirect_to ted_path(@ted)
      #TODO : flash message successfull
    else
      render new
      #TODO : flash error
    end
  end

  private

  def chapter_params
    params
    .require(:chapter)
    .permit(
      :description,
      :localisation,
      :country,
      :likes,
      photos_attributes: [
        :id,
        :title,
        :image,
        :_destroy
      ])
  end

  def set_ted
    @ted = Ted.find(params[:ted_id])
  end

end
