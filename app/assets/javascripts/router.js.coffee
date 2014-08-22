# For more information see: http://emberjs.com/guides/routing/

Roomnhouse.Router.reopen location: "history"

Roomnhouse.Router.map ()->
  rootURL: '/'
  @resource 'users', path: '/admin', ->
  	@route 'new', path: 'users/new'
  	@resource 'user', path: '/users/:id'
	
  @resource 'offers', path: '/admin/offers', ->
  		@resource 'offer', path: '/:id'
