# For more information see: http://emberjs.com/guides/routing/

Roomnhouse.Router.reopen location: "history"

Roomnhouse.Router.map ()->
  rootURL: '/'
  @resource 'users', path: '/admin/users', ->
    @route 'new', path: 'users/new'
    @resource 'user', path: '/:id'

  @resource 'offers', path: '/admin/offers', ->
    @route 'new', path: 'offers/new'
    @resource 'offer', path: '/:id'
