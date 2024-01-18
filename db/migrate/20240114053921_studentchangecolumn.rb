class Studentchangecolumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :students,:users_id,:user_id
    rename_column :students,:admins_id,:admin_id
  end
end
