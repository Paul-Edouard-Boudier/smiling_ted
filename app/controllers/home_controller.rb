class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def welcome
  end
end
