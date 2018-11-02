class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    # add_column, users which is the table, name of the column/attribute, next is password_digest and this has to be called password_digest for this to work and then next is the type
    add_column :users, :password_digest, :string
    
  end
end
