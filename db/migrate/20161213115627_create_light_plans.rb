class CreateLightPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :light_plans do |t|
      t.string :status
      t.integer :value
      t.datetime :date

      t.timestamps
    end
  end
end
