class CvsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user_detail =  current_user.build_user_detail unless current_user.have_user_detail?
    @cv = current_user.cvs.build
    @cv.experience.build
  end

  def create
    @cv = current_user.cvs.build(params[:cv])
    if @cv.save
      redirect_to cv_route_path @cv.id
    else
      render :new
    end
  end

  def show 
    @cv = current_user.cvs.find(params[:id])  
  end

  def add_experience
    respond_to do |format|
      format.js
    end
  end
end
