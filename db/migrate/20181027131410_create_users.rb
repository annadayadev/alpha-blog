class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      	t.string :username
	      t.string :email
	      
	      # we include so we'll get created at and updated at 
	      t.timestamps
    end
  end
end
