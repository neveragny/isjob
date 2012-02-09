class ListingsController < ApplicationController

  def index
    @listings = Listing.all 
  end

  def new
    @new_listing = Listing.new
  end

  def create
    @new_listing = Listing.new(params[:listing])
    if @new_listing.save 
      redirect_to :listings 
    end
end
  end
