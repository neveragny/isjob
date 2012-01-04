class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_have_cv!, :only => :index
  before_filter :is_company
 
  def index
  end

  private
  def is_company
    if current_user.is_company?
      redirect_to :controller => :companies, :action => :index
    end
  end

  def user_have_cv!
    unless current_user.is_company?
      redirect_to new_cv_path unless current_user.cvs.any?
    end
  end

end
