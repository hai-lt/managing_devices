class CreateCameras < ActiveRecord::Migration[5.0]
  def change
    create_table :cameras do |t|
      t.float :x
      t.float :y
      t.text :description
      t.string :source

      t.timestamps
    end
  end
end
