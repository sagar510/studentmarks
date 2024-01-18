class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.references :users, foreign_key: true
      t.references :admins, foreign_key:true
      t.timestamps
    end
  end
end
