class PhotoSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :description, :offer_id, :image
end
