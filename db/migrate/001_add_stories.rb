class AddStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.column :title , :string, :null => false
      t.column :link, :string, :null => false
      t.column :score, :integer
      t.column :comment_count, :integer
      t.column :writer_id, :integer
      t.timestamps
    end
  end


 def self.down
   drop_table :stories
 end
 end
