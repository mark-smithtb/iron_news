class AddComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :comment , :string, :null => false
      t.column :writer_id, :integer
      t.column :story_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
