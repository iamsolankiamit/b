Roomnhouse.OffersNewController = Ember.Controller.extend
  needs: ['currentUser']
  queryParams: ['user_id']
  user_id: null
  actions:
    createOffer: ->
      offer = @store.createRecord 'offer', @get('fields')
      if user_id
        offer.user_id = user_id
      else
        offer.user_id = currentUser.id

      offer.save().then =>
        @transitionToRoute 'offer', offer
