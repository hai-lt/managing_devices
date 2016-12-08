class RanksController < ApplicationController
  def create
    @rank = Rank.create(permit_params)
    respond_to do |format|
      if @rank
        format.html { redirect_to @rank, notice: 'Create successfully' }
        format.js {  }
        format.json { render json: @rank, status: :created, location: @rank }
      end
    end
  end

  def index
    @ranks = Rank.all.order_by(:level)
  end

  def update
    @rank = Rank.find_by(level: params[:id])
    if @rank.update(permit_params)
      respond_to do |format|
        format.html { }
        format.js { render file: 'ranks/update' }
      end
    end
  end

  def destroy
    @rank = Rank.find_by(level: params[:id])
    respond_to do |format|
      if @rank.destroy
        # format.html { redirect_to @rank, success: 'Rank has already deleted' }
        format.js { }
      end
    end
  end

  def show
  end

  def edit
    @rank = Rank.find_by(level: params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @rank = Rank.new
    respond_to do |format|
      format.html { }
      format.js { render file: 'ranks/edit'}
    end
  end

  private

    def permit_params
      params.require(:rank).permit(:desc, :level)
    end
end
