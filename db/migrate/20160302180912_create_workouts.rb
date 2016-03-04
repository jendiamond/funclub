class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :date_time
      t.string :activity
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
