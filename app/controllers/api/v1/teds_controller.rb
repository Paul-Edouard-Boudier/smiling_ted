class Api::V1::TedsController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show]

  def index
    if params[:search].blank?
      @teds = policy_scope(Ted)
    else
      @teds = policy_scope(Ted)
      .where('name ILIKE ?', "%#{params[:search]}%")
    end
  end

  def show
  end

  private

  def set_restaurant
    @ted = Ted.find(params[:id])
    authorize @ted #for pundit
  end


end
