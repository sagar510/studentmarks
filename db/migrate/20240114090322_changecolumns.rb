class Changecolumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :teachers,:users_id,:user_id
    rename_column :teachers,:admins_id,:admin_id
    rename_column :teacher_courses,:teachers_id,:teacher_id 
    rename_column :teacher_courses,:courses_id,:course_id
  end
end
