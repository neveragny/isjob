class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_have_cv!, :only => :index
  before_filter :is_company

  private
  def is_company
    current_user.is_company? ? (redirect_to :controller => :companies, :action => :index)
                             : (redirect_to :controller => :employee, :action => :notepad)
  end

  def user_have_cv!
    unless current_user.is_company?
      redirect_to new_cv_path unless current_user.cvs.any?
    end
  end

end
