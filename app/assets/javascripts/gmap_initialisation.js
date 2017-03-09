$(document).ready(function() {
  $('.gmap').each(function(i, map) {
    var id = $(map).attr('id');
    var lat = $(map).data('latitude');
    var lng = $(map).data('longitude');

    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: { id: id },
      provider: {
      styles: [{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7dcdcd"}]}]
      }

      }, function() {

      markers = handler.addMarker({
        lat: lat,
        lng: lng
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
