class AddPhotosToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :photos, :json
  end
end
