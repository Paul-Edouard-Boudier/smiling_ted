class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def welcome
  end

  def rules
  end

  def shop
  end

  def info
  end

  def team
  end

  def contact
  end

end
