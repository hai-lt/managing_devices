class RoomsController < ApplicationController
  def create
    @room = Room.create(permit_params)
    respond_to do |format|
      if @room
        format.html { redirect_to @room, notice: 'Create successfully' }
        format.js {  }
        format.json { render json: @room, status: :created, location: @room }
      end
    end
  end

  def index
    @rooms = Room.all
  end

  def update
    @room = Room.find_by(id: params[:id])
    if @room.update(permit_params)
      respond_to do |format|
        format.html { }
        format.js { render file: 'rooms/update' }
      end
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    respond_to do |format|
      if @room.destroy
        # format.html { redirect_to @room, success: 'Room has already deleted' }
        format.js { }
      end
    end
  end

  def show
  end

  def edit
    @room = Room.find_by(id: params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
  end

  private

    def permit_params
      params.require(:room).permit(:desc, :block, :no, :capacity)
    end
end
