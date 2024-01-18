class Teacher < ApplicationRecord
    belongs_to :user
    belongs_to :admin

    has_many :teacher_course
    has_many :course, through: :teacher_course
end
