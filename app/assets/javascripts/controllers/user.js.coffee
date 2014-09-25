Roomnhouse.UserController = Ember.ObjectController.extend
  
  needs: ['currentUser']
  actions:
    saveChanges: -> 
      user = @get('model')
      user.set('listerId',@get('controllers.currentUser.content').id)
      user.save()