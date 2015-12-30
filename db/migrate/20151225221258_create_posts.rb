class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :header
      t.text :content
      t.integer :user_id
      t.string :file_name
      t.timestamps
    end
  end
end
