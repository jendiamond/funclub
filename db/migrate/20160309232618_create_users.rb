class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.date :birthday
      t.string :avatar

      t.timestamps null: false
    end
  end
end
