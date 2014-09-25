Roomnhouse.TranslationRoute = Ember.Route.extend

  model: (params) -> @store.find 'translation', params.id
