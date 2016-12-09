class CategoriesController < ApplicationController
  before_action :authenticate?

  def create
    @category = Category.find_or_create_by(permit_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all.order(:id)
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.present? && @category.update(permit_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  def show
    @devices = Device.where(category_id: params[:id])
    render 'devices/index'
  end

  def edit
    @category = Category.find_by(id: params[:id])
    return render 'edit' if @category
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  private

    def permit_params
      params.require(:category).permit(:name, :desc, :id)
    end
end
