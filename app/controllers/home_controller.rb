class HomeController < ApplicationController
#  before_filter :authenticate_user!
  before_filter :user_have_cv!, :only => :index
  before_filter :guest_or_user

  private
  def guest_or_user
    current_user ? ( current_user.is_company? ? (redirect_to :controller => :companies, :action => :index)
                                 : (redirect_to :controller => :employee, :action => :notepad) )
                 : nil
  end

  def user_have_cv!
#    unless current_user.is_company?
#      redirect_to new_cv_path unless current_user.cvs.any?
#    end
  end

end
