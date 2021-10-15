class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :admin, :created_at
end
