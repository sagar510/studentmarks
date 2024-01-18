class Addyearongoing < ActiveRecord::Migration[6.0]
  def change
    add_column :enrolments,:year,:integer
    
  end
end
