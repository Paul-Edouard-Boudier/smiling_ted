$(function() {
    $('.autocomplete').each(function(i, elem) {
      new google.maps.places.Autocomplete(elem, { types: ['geocode'] });
      google.maps.event.addDomListener(elem, 'keydown', function(e) {
        if (e.keyCode == 13) {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    });
  });