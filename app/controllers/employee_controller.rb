class EmployeeController < ApplicationController
  def index
    
  end

  def cv_list
    @cvs = current_user.cvs
    respond_to do |format|
      format.js 
    end
  end

end
