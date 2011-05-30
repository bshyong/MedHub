class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :handle
      t.string :first_name
      t.string :last_name
      t.string :salt
      t.string :hashed_password
      t.integer :role, :default => 2

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :handle

  end

  def self.down
    drop_table :users
  end
end
