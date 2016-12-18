class AddSensorToLightPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :light_plans, :sensor, :boolean
  end
end
