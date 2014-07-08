class CreateUsersWeekdays < ActiveRecord::Migration
  def change
    create_table :users_weekdays do |t|
    	t.integer :user_id
    	t.integer :weekday_id
    end
  end
end
