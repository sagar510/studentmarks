class User < ApplicationRecord

    has_one :admin
    has_one :student
    has_one :teacher

    enum role: [:student, :teacher, :admin]

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 6}
    validates :role, presence: true

end
