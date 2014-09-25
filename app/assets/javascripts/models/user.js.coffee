Roomnhouse.User = DS.Model.extend
  firstname: DS.attr('string')
  listerId: DS.attr('number')
  lastname: DS.attr('string')
  email: DS.attr('string')
  phone: DS.attr('number')
  offers: DS.hasMany('offer')
