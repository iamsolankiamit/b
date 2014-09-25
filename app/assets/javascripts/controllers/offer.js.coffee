Roomnhouse.OfferController = Ember.ObjectController.extend
	
	actions:
  
		saveChanges: -> 
      offer = @get('model')
      firstTranslation = offer.get('translations.firstObject')
      firstTranslation.save()
      offer.save()