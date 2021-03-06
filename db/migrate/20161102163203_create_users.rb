class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :address
      t.string :phone
      t.string :avatar
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
