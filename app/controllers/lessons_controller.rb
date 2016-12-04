class LessonsController < ApplicationController
  def create
    @lesson = Lesson.create(permit_params)
    respond_to do |format|
      if @lesson
        format.html { redirect_to @lesson, notice: 'Create successfully' }
        format.js {  }
        format.json { render json: @lesson, status: :created, location: @lesson }
      end
    end
  end

  def index
    @lessons = Lesson.all.order_by(:code)
  end

  def update
    @lesson = Lesson.find_by(code: params[:id])
    if @lesson.update(permit_params)
      respond_to do |format|
        format.html { }
        format.js { render file: 'lessons/update' }
      end
    end
  end

  def destroy
    @lesson = Lesson.find_by(code: params[:id])
    respond_to do |format|
      if @lesson.destroy
        # format.html { redirect_to @lesson, success: 'Lesson has already deleted' }
        format.js { }
      end
    end
  end

  def show
  end

  def edit
    @lesson = Lesson.find_by(code: params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @lesson = Lesson.new
    respond_to do |format|
      format.html { }
      format.js { render file: 'lessons/edit'}
    end
  end

  private

    def permit_params
      params.require(:lesson).permit(:code, :name, :start, :finish)
    end
end
