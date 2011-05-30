class ChangeColumnName < ActiveRecord::Migration
  def self.up
    rename_column :thing_data, :attribute, :name
  end

  def self.down
    rename_column :thing_data, :name, :attribute
  end
end