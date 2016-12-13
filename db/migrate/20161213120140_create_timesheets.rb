class CreateTimesheets < ActiveRecord::Migration[5.0]
  def change
    create_table :timesheets do |t|
      t.integer :turn_on
      t.integer :turn_off
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
