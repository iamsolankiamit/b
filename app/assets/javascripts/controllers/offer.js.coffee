Roomnhouse.OfferController = Ember.ObjectController.extend
	
	actions:
  
		saveChanges: -> 
      offer = @get('model')
      console.log(offer.get('translations'))
      offer.save()