class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :phone, :lister_id
end
