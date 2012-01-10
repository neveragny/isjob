class EmployeeController < ApplicationController
  respond_to :html, :js, :json

  def notepad
    @cvs = current_user.cvs
  end

  def cv_list
    @cvs = current_user.cvs
  end

  def details
    @detail = current_user.user_detail
  end

  def calendar

  end

end
