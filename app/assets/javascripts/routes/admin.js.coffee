Roomnhouse.AdminRoute = Ember.Route.extend
	
	model: (params) -> @store.find 'admin', params.id