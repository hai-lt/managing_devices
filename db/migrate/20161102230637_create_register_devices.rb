class CreateRegisterDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :register_devices do |t|
      t.string :status
      t.text :reason
      t.string :from
      t.string :to
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end

    add_foreign_key :register_devices, :lessons, column: :from, primary_key: "code", on_delete: :cascade
    add_foreign_key :register_devices, :lessons, column: :to, primary_key: "code", on_delete: :cascade
  end
end
