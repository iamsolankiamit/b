Roomnhouse.UsersController = Ember.ArrayController.extend
  needs: ['currentUser']
	sortProperties: ['createdAt']