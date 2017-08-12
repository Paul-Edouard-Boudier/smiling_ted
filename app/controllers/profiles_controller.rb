class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize :Profile, :show?
  end
end
