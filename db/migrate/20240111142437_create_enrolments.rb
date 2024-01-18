class CreateEnrolments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolments do |t|
      t.integer :marks
      t.references :courses, foreign_key: true
      t.references :students, foreign_key: true
      t.references :exams, foreign_key: true
      t.timestamps
    end
  end
end
