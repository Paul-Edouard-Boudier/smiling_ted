class TedsController < ApplicationController
  before_action :find_ted, only: [:show, :distance_traveled]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:name].present?
      @teds = Ted.where('name like ?', params[:name])
    else
      @teds = Ted.all
      @teds = Ted.where.not(latitude: nil, longitude: nil)

      @hash = Gmaps4rails.build_markers(@teds) do |ted, marker|
        marker.lat ted.latitude
        marker.lng ted.longitude
      end
    end
  end

  def show
    @chapters = @ted.chapters
    @chapters = @chapters.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@chapters) do |chapter, marker|
      marker.lat chapter.latitude
      marker.lng chapter.longitude
    end
  end

  def new
    @ted = Ted.new
  end

  def create
    @ted = Ted.new(ted_params)
    @ted.user = current_user
      if @ted.save
        redirect_to ted_path(@ted)
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def check_code
    @ted = Ted.find(params[:ted_id])
    if params[:ted_code] == @ted.code
      redirect_to new_ted_chapter_path(@ted)
    else
      render 'show'
    end
  end

  private


  def ted_params
    params
    .require(:ted)
    .permit(:name, :rank, :distance_traveled, :code, :avatar)
  end

  def find_ted
    @ted = Ted.find(params[:id])
  end

end
