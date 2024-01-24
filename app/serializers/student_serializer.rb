class StudentSerializer < ActiveModel::Serializer
  attributes :id,:student_name,:admin_id

  belongs_to :admin, serializer: AdminSerializer
end
