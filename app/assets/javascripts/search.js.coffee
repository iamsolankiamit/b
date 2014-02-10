# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder
  #override create_marker method
  # create_marker: ->
  # options = _.extend @marker_options(), @rich_marker_options()
  # @serviceObject = new RichMarker options #assign marker to @serviceObject

  #  rich_marker_options: ->
  #   marker = document.createElement("div")
  #  marker.setAttribute 'class', 'marker_container'
  #  marker.innerHTML = @args.marker
  #  { content: marker }

  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'gmap-info-box') #to customize
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140,-350)
    boxStyle:
      width: "280px"

json_array = []
$(".listing").each ->
  json =
    lat: $(this).data("lat")
    lng: $(this).data("lng")
    title: $(this).data("title")
    infowindow: "<a href='" + $(this).data("url") + "' class='thumbnail'><div class='price-box'><div class='price'><sup><i class='icon-inr'></i></sup>" + $(this).data("price") + "<sup>INR</sup></div><div class='price-info'>Per night</div></div><img src='" + $(this).data("image") + "' class='img-responsive'/><div class='caption'><div class='title'>" + $(this).data("title") + "</div><div class='location'>" + $(this).data("property-type") + "</div><div class='location'>" + $(this).data("location") + "</div></div></a>"

  json_array.push json
  return



handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} } #dependency injection

#then standard use
handler.buildMap { provider: {}, internal: {id: 'search_page'} }, ->
  markers = handler.addMarkers(json_array)
  handler.bounds.extendWith(markers)
  handler.fitMapToBounds()
