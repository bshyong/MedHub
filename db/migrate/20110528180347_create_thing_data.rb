class CreateThingData < ActiveRecord::Migration
  def self.up
    create_table :thing_data do |t|
      t.integer :thing_id
      t.string :attribute
      t.text :value

      t.timestamps
    end

    add_index :thing_data, :thing_id
    add_index :thing_data, :attribute
    add_index :thing_data, :value

  end

  def self.down
    drop_table :thing_data
  end
end
