class Api::V1::TedsController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show]

  def index
    @teds = policy_scope(Ted)
  end

  def show
  end

  private

  def set_restaurant
    @ted = Ted.find(params[:id])
    authorize @ted #for pundit
  end


end
