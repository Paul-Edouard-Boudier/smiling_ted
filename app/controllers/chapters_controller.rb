class ChaptersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @ted = Ted.find(params[:ted_id])
    @chapter = Chapter.find(params[:id])
  end

  def new
    @ted = Ted.find(params[:ted_id])
    @user = current_user
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.ted = Ted.find(params[:ted_id])
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
    .permit(:description, :localisation, :likes, :ted_id, tasks_attributes: [:id, :description, :done, :_destroy])
  end

end
