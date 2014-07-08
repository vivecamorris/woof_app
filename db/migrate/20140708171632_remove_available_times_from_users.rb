class RemoveAvailableTimesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :availabletime, :string
  end
end
