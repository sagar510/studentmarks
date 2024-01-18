class Course < ApplicationRecord
    has_many :teacher_course
    has_many :teacher, through: :teacher_course

    has_many :enrolment
    has_many :student, through: :student
end
