class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @teds = Ted.all.last(6)
    filtered_ted
  end

  def rules
  end

  def info
  end

  def team
  end

  def shop
  end

  def contact
  end

  private

   def filtered_ted
    @teds = @teds.where('name: like ?', params[:name]) if params[:name].present?
  end
end
