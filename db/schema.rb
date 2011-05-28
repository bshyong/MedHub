# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110528183340) do

  create_table "thing_data", :force => true do |t|
    t.integer  "thing_id"
    t.string   "attribute"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thing_data", ["attribute"], :name => "index_thing_data_on_attribute"
  add_index "thing_data", ["thing_id"], :name => "index_thing_data_on_thing_id"
  add_index "thing_data", ["value"], :name => "index_thing_data_on_value"

  create_table "things", :force => true do |t|
    t.integer  "thing_type"
    t.integer  "upvote",     :default => 0
    t.integer  "downvote",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "things", ["downvote"], :name => "index_things_on_downvote"
  add_index "things", ["thing_type"], :name => "index_things_on_thing_type"
  add_index "things", ["upvote"], :name => "index_things_on_upvote"

end
