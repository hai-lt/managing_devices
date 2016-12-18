class LightPlansController < ApplicationController
  def new
    name = get_name(params[:id])
    @light_plan = LightPlan.new(value: params[:id], name: name, status: 'pending', date: DateTime.now + 7.hours)

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def create
    if params[:light_plan][:sensor].to_i == 0 && params[:light_plan][:value].to_i == 1
      params[:light_plan][:sensor] = false
    end
    @light_plan = LightPlan.create(permit_params)
    @light_plan.update_attributes(date: @light_plan.date - 7.hours)
    @light_plans = LightPlan.all.order('date desc').take(10)
    respond_to do |f|
      f.html { }
      f.js { render 'create' }
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

  def edit
    @light_plan = LightPlan.find(params[:id])
    @light_plan.date += 7.hours

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def update
    light_plan = LightPlan.find(params[:id])
    if light_plan.status == 'done'
      @light_plan = LightPlan.create(permit_params)
    else
      light_plan.update(permit_params)
      @light_plan = light_plan
    end
    @light_plan.update_attributes(date: @light_plan.date - 7.hours)
    @light_plans = LightPlan.all.order('date desc').take(10)
    respond_to do |f|
      f.html { }
      f.js { render 'update' }
    end

  end
  private

  def permit_params
    params.require(:light_plan).permit(:sensor, :status, :date, :name, :value)
  end

  def get_name(id)
    names = ['Green-Yellow-Red mode', 'Yellow mode', 'Turn Off']
    if id.to_i == 10
      name = names[1]
    else
      if id.to_i == 100
        name = names[2]
      else
        name = names[0]
      end
    end
    name
  end
end
