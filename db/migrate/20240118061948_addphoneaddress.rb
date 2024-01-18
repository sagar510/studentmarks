class Addphoneaddress < ActiveRecord::Migration[6.0]
  def change
    add_column :students,:phone,:string
    add_column :students,:address,:string
    
    add_column :teachers,:phone,:string
    add_column :teachers,:address,:string

    add_column :admins,:phone,:string
    add_column :admins,:address,:string
  end
end
