Roomnhouse.UsersNewController = Ember.Controller.extend
	actions:

		createUser: ->
			user = @store.createRecord 'user', @get('fields')
			user.save().then =>
				@transitionToRoute 'user', user