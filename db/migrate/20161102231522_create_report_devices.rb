class CreateReportDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :report_devices do |t|
      t.text :desc
      t.string :rank_id
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end

    add_foreign_key :report_devices, :ranks, column: :rank_id, primary_key: "level"
  end
end
