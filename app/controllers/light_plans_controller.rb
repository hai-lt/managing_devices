class LightPlansController < ApplicationController
  def new
    LightPlan.create(value: params[:id])
    @light_plans = LightPlan.all.order('date desc')

    respond_to do |f|
      f.html { }
      f.js { render 'new' }
    end
  end
end
