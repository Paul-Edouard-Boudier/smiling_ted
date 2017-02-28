class TedsController < ApplicationController
  before_action :find_ted, only: [:show]
  def index
    @teds = Ted.all
    # filtered_ted
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

  def filtered_ted
    # @yachts = @yachts.where('price <= ?', params[:query][:price_max]) if params[:query][:price_max].present?
    # (name) { where("name like ?", "#{name}%")}
    if params[:query][:name].present?
      @teds = @teds.where('name like ?', '%#{name}%')
    end
  end

  def ted_params
    params
    .require(:ted)
    .permit(:name, :rank, :distance_traveled, :code)
  end

  def find_ted
    @ted = Ted.find(params[:id])
  end
end
