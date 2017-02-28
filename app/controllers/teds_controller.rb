class TedsController < ApplicationController
  before_action :find_ted, only: [:show]
  def index
    filtered_ted
  end

  def show
  end

  def new
    @ted = Ted.new
  end

  def create
    @ted = Ted.new
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

  def filtered_ted
    if params[:name].present?
      @teds = Ted.where('name like ?', params[:name])
    else
      @teds = Ted.all
    end
  end

  def ted_params
    params
    .require(:ted)
    .permit(:name, :rank, :distance_traveled, :code, photos: [])
  end

  def find_ted
    @ted = Ted.find(params[:id])
  end
end
