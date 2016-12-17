class LightPlansController < ApplicationController
  def new
    names = ['Green-Yellow-Red mode', 'Yellow mode', 'Turn Off']
    if params[:id].to_i == 10
      name = names[1]
    else
      if params[:id].to_i == 100
        name = names[2]
      else
        name = names[0]
      end
    end
    LightPlan.create(value: params[:id], name: name)
    @light_plans = LightPlan.all.order('date desc').take(10)

    respond_to do |f|
      f.html { }
      f.js { render 'new' }
    end
  end

  def destroy
    @light_plan = LightPlan.find(params[:id])
    @light_plan.destroy

    respond_to do |f|
      f.html { }
      f.js { render 'destroy' }
    end
  end
end
