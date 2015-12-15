class AddToUsers < ActiveRecord::Migration
  def change
  	t.string :role
  end
end
