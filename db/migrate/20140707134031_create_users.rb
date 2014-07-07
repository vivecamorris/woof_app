class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :netid
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :year
      t.string :college
      t.string :location
      t.string :availabletime
      t.string :description
      
      t.timestamps
    end
  end
end
