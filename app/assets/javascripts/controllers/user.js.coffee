Roomnhouse.UserController = Ember.ObjectController.extend
  
  needs: ['currentUser']
  actions:
    saveChanges: -> 
      user = @get('model')
      user.listerId = currentUser.id
      user.save()