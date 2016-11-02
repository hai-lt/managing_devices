class CreateReportDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :report_devices do |t|
      t.text :desc
      t.references :rank, foreign_key: true
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
