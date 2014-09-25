#= require underscore
#= require jquery
#= require jquery.sticky
#= require jquery.ui.datepicker
#= require jquery_ujs
#= require s3_direct_upload
#= require jquery-migrate-1.2.1.min.js
#= require jquery.geocomplete.min.js
#= require gmaps/google
#= require markerclusterer.js
#= require /mixpanel/mixpanel.js
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require roomnhouse
#= require_tree .

# for more details see: http://emberjs.com/guides/application/
window.Roomnhouse = Ember.Application.create(
  rootElement: '#main'
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL:true
  LOG_VIEW_LOOKUPS: true
)
