class AddTypeUserToUser < ActiveRecord::Migration
  def change
  	add_column :users, :type_user, :string
  end
end
