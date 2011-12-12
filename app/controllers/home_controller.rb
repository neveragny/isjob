class HomeController < ApplicationController
  def index
    @users = User.all
    flash[:notice] = 'you just here'
  end
end
