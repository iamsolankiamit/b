Roomnhouse.User = DS.Model.extend
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  email: DS.attr('string')
  phone: DS.attr('number')
  users: DS.hasMany('user')
  admin: DS.belongsTo('admin')
  
