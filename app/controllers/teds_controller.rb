class TedsController < ApplicationController
  before_action :find_ted, only: [:show]
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

  # if params[:name].present?
  #     @teds = Ted.where('name like ?', params[:name])
  #     @teds = Ted.where.not(latitude: nil, longitude: nil)
  #     @hash = Gmaps4rails.build_markers(@teds) do |ted, marker|
  #       marker.lat ted.latitude
  #       marker.lng ted.longitude
  #     end
  #   else
  #     @teds = Ted.all
  #     @teds = Ted.where.not(latitude: nil, longitude: nil)
  #     @hash = Gmaps4rails.build_markers(@chapters) do |chapter, marker|
  #       marker.lat chapter.last.latitude
  #       marker.lng chapter.last.longitude
  #     end
  #   end
