class PagesController < ApplicationController
  def home
    @teds = Ted.all
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
