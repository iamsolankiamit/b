class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :firstname, :lastname, :email, :phone, :lister_id

  has_many :offers
end
