  //state co-ordinates
  var states = {
    "VIC": {lat: -36.5185827, lng: 140.978258},
    "SA": {lat: -31.9495406, lng: 130.5079709},
    "NSW": {lat: -32.7503099, lng: 142.8255387},
    "WA": {lat: 24.1709455, lng: 111.9329231},
    "NT": {lat: -18.247301, lng: 124.4607377},
    "QLD": {lat: -19.3313579, lng: 136.7358599},
    "ACT": {lat: -35.5212255, lng: 148.5212304}
  };

  //fake responses - will need a real API response that looks like this.
  var fakeJson = [
    {
       suburb_name: "Richmond",
       median_price_house: 1000000,
       median_price_unit: 500000,
       state: "VIC",
       lat: "-37.8219826",
       long: "144.984614"
    },
    {
      suburb_name: "Fitzroy",
      median_price_house: 1000000,
      median_price_unit: 500000,
      state: "VIC",
      lat: "-37.8009696",
      long: "144.9704181"
    }
  ];

  var lat = Number(fakeJson[0].lat)
  var long = Number(fakeJson[0].long)

  function initMap() {
    var centre = {lat: lat, lng: long};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: centre
    });

      _.each(fakeJson, function(suburb) {
        var lat = Number(suburb.lat)
        var lng = Number(suburb.long)
        var marker = new google.maps.Marker({
              position: { lat: lat, lng: lng },
              map: map,
              title: suburb.suburb_name
            });
            var infoWindow = new google.maps.InfoWindow(
              {content: suburb.suburb_name + '<br>' + 'Median house price: ' + suburb.median_price_house + '<br>' + 'Median unit price: ' + suburb.median_price_unit}
             );
            marker.addListener('click', function() {
              infoWindow.open(map, marker);
          });
        });
}; //closes init function
