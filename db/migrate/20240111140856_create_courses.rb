class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.boolean :ongoin_course
      t.timestamps
    end
  end
end
