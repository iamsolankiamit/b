Roomnhouse.OfferRoute = Ember.Route.extend
	
	model: (params) -> @store.find 'offer', params.id