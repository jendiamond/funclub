class AddAddressToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :address, :string
  end
end
