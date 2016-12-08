class AddStatusToReportDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :report_devices, :status, :string, default: 'new'
  end
end
