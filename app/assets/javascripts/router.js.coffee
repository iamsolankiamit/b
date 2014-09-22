# For more information see: http://emberjs.com/guides/routing/

Roomnhouse.Router.reopen location: "history"

Roomnhouse.Router.map ()->
  rootURL: '/'
  @resource 'users', path: '/admin', ->
    @route 'new', path: 'users/new'
    @resource 'user', path: '/users/:id'

  @resource 'offers', path: '/admin/offers', ->
    @resource 'offer', path: '/:id'

  @resource 'translations', path: '/admin/translations', ->
    @resource 'translation', path: '/:id'

  @resource 'photos', path: '/admin/photos', ->
    @resource 'photo', path: '/:id'
