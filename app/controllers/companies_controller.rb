class CompaniesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @positions = current_user.company.positions if current_user && current_user.company
  end

  def positions
    @positions = current_user.company.positions
    respond_to do |format|
      format.js
    end  
  end
end
