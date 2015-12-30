class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :first_name
		t.string :last_name
		t.string :avatar , :default => "public/default.png"
		t.timestamps
    end
  end
end
