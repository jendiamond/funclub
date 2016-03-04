ActiveRecord::Schema.define(version: 20160302180912) do

  create_table "workouts", force: :cascade do |t|
    t.datetime "date_time"
    t.string   "activity"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
end
