Roomnhouse.UserController = Ember.ObjectController.extend
	
	actions:
  
		saveChanges: -> @get('model').save()