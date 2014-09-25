Roomnhouse.Translation = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  offer: DS.belongsTo('offer')
