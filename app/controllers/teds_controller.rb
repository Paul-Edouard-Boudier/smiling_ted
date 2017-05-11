class TedsController < ApplicationController
  before_action :find_ted, only: [:show, :distance_traveled]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:name].present?
      @teds = Ted.where('name like ?', params[:name])
    elsif params[:code].present?
      @teds = Ted.where(code: params[:code])

    else
      @teds = policy_scope(Ted)
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

    @chapters.map do |chapter|

    end

    @hash = Gmaps4rails.build_markers(@chapters) do |chapter, marker|
      marker.lat chapter.latitude
      marker.lng chapter.longitude


    end
    if @hash.present?
      @hash.each do |item|
        item.merge!({ picture: { url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|74ccfc", width: 64, height: 64, anchor: [10.5, 34] }})
      end
      @hash.last.merge!({ picture: { url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|fc4016", width: 64, height: 64, anchor: [10.5, 34] }})
    end
  end

  def new
    @ted = Ted.new
  end

  def create
    @ted = Ted.find_by_code(params[:ted][:code])

    if @ted.orphan? && @ted.update(ted_params)
      redirect_to ted_path(@ted)
    else
      render :new
    end
  end

  def edit

  end

  def update
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


  def check_code
    @ted = Ted.find(params[:ted_id])
    if params[:ted_code] == @ted.code
      redirect_to new_ted_chapter_path(@ted)
    else
      render 'show'
    end
  end

  def ted_params
    params
      .require(:ted)
      .permit(:name, :avatar)
      .merge(user: current_user)
  end

  def find_ted
    @ted = Ted.find(params[:id])
  end

end
