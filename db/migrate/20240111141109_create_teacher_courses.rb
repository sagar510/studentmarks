class CreateTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_courses do |t|
      t.integer :year
      t.references :teachers, foreign_key: true
      t.references :courses, foreign_key: true
      t.timestamps
    end
  end
end
