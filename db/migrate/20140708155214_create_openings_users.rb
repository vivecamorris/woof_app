class CreateOpeningsUsers < ActiveRecord::Migration
  def change
    create_table :openings_users do |t|
    	t.integer :opening_id
    	t.integer :user_id
    end
  end
end
