class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.strong :name
      t.date :import_date
      t.text :desc
      t.string :status
      t.bigint :price
      t.string :brand
      t.string :made_by
      t.date :date_producer
      t.integer :reporter_id
      t.references :category, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end

    add_foreign_key :devices, :users, column: :reporter_id, on_delete: :cascade
  end
end
