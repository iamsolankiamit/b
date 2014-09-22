Roomnhouse.Photo = DS.Model.extend
  description: DS.attr('string')
  offer: DS.belongsTo('offer', async: true)
