$(document).ready(function() {
    $('.autocomplete').each(function(i, elem) {
      var autocomplete = new google.maps.places.Autocomplete(elem, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(elem, 'keydown', function(e) {
        if (e.keyCode == 13) {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    });
});
  

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);



  if (components.country_code) {
    $('#chapter_country').val(components.country_code);
  }
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    country_code: country_code
  };
}