Roomnhouse.User = DS.Model.extend
	firstname: DS.attr('string')
	lastname: DS.attr('string')
	email: DS.attr('string')
	contactPhone: DS.attr('string')
	offers: DS.hasMany('offer')