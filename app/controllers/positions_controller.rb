class PositionsController < ApplicationController
  def create
    @position = Position.create(permit_params)
    respond_to do |format|
      if @position
        format.html { redirect_to @position, notice: 'Create successfully' }
        format.js {  }
        format.json { render json: @position, status: :created, location: @position }
      end
    end
  end

  def index
    @positions = Position.all.order_by(:id)
  end

  def update
    @position = Position.find_by(id: params[:id])
    if @position.update(permit_params)
      respond_to do |format|
        format.html { }
        format.js { render file: 'positions/update' }
      end
    end
  end

  def destroy
    @position = Position.find_by(id: params[:id])
    respond_to do |format|
      if @position.destroy
        # format.html { redirect_to @position, success: 'Position has already deleted' }
        format.js { }
      end
    end
  end

  def show
  end

  def edit
    @position = Position.find_by(id: params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @position = Position.new
    respond_to do |format|
      format.html { }
      format.js { render file: 'positions/edit'}
    end
  end

  private

    def permit_params
      params.require(:position).permit(:desc, :name)
    end
end
