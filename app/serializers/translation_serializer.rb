class TranslationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :description, :offer_id
end
