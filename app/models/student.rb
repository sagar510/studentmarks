class Student < ApplicationRecord
    belongs_to :user
    belongs_to :admin

    has_many :enrolment
    has_many :course, through: :enrolment
end
