Roomnhouse.ApplicationController = Ember.Controller.extend
  needs: ['currentUser']
  queryParams: ['listerId']
  listerId: Ember.computed.alias('controllers.currentUser.content').id
