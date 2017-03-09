$(document).ready(function() {
  $('.gmap').each(function(i, map) {
    var id = $(map).attr('id');
    var lat = $(map).data('latitude');
    var lng = $(map).data('longitude');

    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: { id: id } }, function() {
    var image = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|fc4016"
      markers = handler.addMarker({
        lat: lat,
        lng: lng,
        icon: image,
      });

      handler.bounds.extendWith(markers);

      handler.fitMapToBounds();

      if (markers.length == 0) {
        handler.getMap().setZoom(2);
      } else if (markers.length == 1) {
        handler.getMap().setZoom(8);
      } else {
        handler.getMap().setZoom(5);
      }
    });
  });
});
