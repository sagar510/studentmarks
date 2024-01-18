class Admin < ApplicationRecord
    belongs_to :user

    has_many :student
    has_many :teacher
end
