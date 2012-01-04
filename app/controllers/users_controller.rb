class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

  def update_user_details
    @details = current_user.build_user_detail(params[:user_detail])
    respond_to do |format|
      if @details.save
        format.js { render :json => { :status => :ok}}
      end
    end  
  end

end
