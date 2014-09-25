Roomnhouse.Photo = DS.Model.extend
  description: DS.attr('string')
  directUploadUrl: DS.attr('string')
  offer: DS.belongsTo('offer')
