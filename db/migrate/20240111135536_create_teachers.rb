class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.references :users, foreign_key: true
      t.references :admins, foreign_key:true
      t.timestamps
    end
  end
end
