class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :exam_name
      t.boolean :ongoing_year_exam
      t.timestamps
    end
  end
end
