class PositionsController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  def show
    @position = current_user.company.positions.find(params[:id])
  end

  def new
    @position = current_user.company.positions.build
    @spheres = Sphere.all
    @busynesses = Busyness.all
    @managers = current_user.company.managers
  end

  def create
    @position = current_user.company.positions.new(params[:position])
    if @position.save
      flash[:notice] = "Successfully created position."
      redirect_to company_position_url(@position.company_id, @position)
    else
      @spheres = Sphere.all
      @busynesses = Busyness.all
      @managers = current_user.company.managers
      render :new
    end
  end

  def update
  end

  def destroy
    @position = current_user.company.positions.find(params[:id])
      respond_to do |format|
        if @position.destroy
          format.js { render :json => {:status => :success, :position_id => @position.id}}
        else
          format.js { render :json => {:status => :failed}}
        end
      end
  end

  def activate
  end

  def deactivate
  end

end
