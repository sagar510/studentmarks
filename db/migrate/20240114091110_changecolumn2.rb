class Changecolumn2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :enrolments,:courses_id,:course_id
    rename_column :enrolments,:students_id,:student_id
    rename_column :enrolments,:exams_id,:exam_id
  end
end
