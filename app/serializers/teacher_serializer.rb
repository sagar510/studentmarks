class TeacherSerializer < ActiveModel::Serializer
  attributes :id,:teacher_name,:admin_id

  belongs_to :admin, serializer: AdminSerializer
end
