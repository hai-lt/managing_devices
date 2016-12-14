class AddNameToLightPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :light_plans, :name, :string
  end
end
