# For more information see: http://emberjs.com/guides/routing/

Roomnhouse.Router.map ()->
  location: 'auto'
  rootURL: '/admin/'
  @resource 'users', path: '/', ->
  	@route 'new', path: 'users/new'
  	@resource 'user', path: '/users/:id'
