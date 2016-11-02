class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :no
      t.string :block
      t.integer :capacity
      t.text :desc

      t.timestamps
    end
  end
end
