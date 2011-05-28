class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.integer :thing_type
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end

    add_index :things, :thing_type
    add_index :things, :upvote
    add_index :things, :downvote

  end

  def self.down
    drop_table :things
  end
end
