class ChangeColumnDefaultsForThings < ActiveRecord::Migration
  def self.up
    change_column :things, :upvote, :integer, :default => 0
    change_column :things, :downvote, :integer, :default => 0
  end

  def self.down
    change_column :things, :upvote, :integer
    change_column :things, :downvote, :integer
  end
end
