class AdminSerializer < ActiveModel::Serializer
  attributes :id,:admin_name

  has_many :student
  has_many :teacher
end
