class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:role

  has_one :student 
  has_one :teacher
  has_one :admin
end
