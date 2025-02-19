class AddAdminUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :admins,:user_id,:bigint 
  end
end
