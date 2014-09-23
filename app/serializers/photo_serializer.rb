class PhotoSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :description, :offer_id, :direct_upload_url
end
