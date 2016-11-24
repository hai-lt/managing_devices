class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks, id: false do |t|
      t.string :level
      t.text :desc

      t.timestamps
    end

    execute 'ALTER TABLE ranks ADD PRIMARY KEY (level)'
  end
end
