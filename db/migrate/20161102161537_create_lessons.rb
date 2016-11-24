class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons, id: false do |t|
      t.string :code
      t.integer :start
      t.integer :finish
      t.string :name

      t.timestamps
    end
    execute 'ALTER TABLE lessons ADD PRIMARY KEY (code)'
  end
end
