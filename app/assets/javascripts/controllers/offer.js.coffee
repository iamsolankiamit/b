Roomnhouse.OfferController = Ember.ObjectController.extend
	
	actions:
  
		saveChanges: -> @get('model').save()