// materialize stuffs

$(".dropdown-button").dropdown();
$('#locality').material_select();


// results data

var settings = {
  url: 'http://localhost:3000/results/data',
  dataType: 'json',
  method: 'get',
};

$.ajax(settings).done(function(response) {

        // iterate over response to populate template for each suburb
        _.each(response, function(suburbText) {
          var templateString = $('#result-template').html();
          var templateFunction = Handlebars.compile(templateString);
          var resultHtml = templateFunction({
            suburbName: suburbText.suburbName,
            medianHouse: suburbText.housePrice,
            medianUnit: suburbText.unitPrice
          });
          var $newElem = $('<div>').html(resultHtml).appendTo('#result');

        });

        // set lat & long as the first suburbs co-ordinates
        // needs to be a - in front of lat (in southern hemisphere anyway)
        var lat = Number(response[0].lat)
        var long = Number(response[0].long)

        // var lat = -38.170513
        // var long = 145.968378

        // intstantiate google map
        function initMap() {
          var centre = {lat: lat, lng: long};
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: centre
          });
            // iterate over response again to populate map with suburbs
            _.each(response, function(suburb) {
              var lat = Number(suburb.lat)
              var lng = Number(suburb.long)
              var test = suburb.suburb_coords
              var test_parsed = JSON.parse(test)

              var polygCoords = function(suburbCoordSet){
                  suburbHash = [];
                  for(i=0;i<suburbCoordSet.length;i++){
                    hashTemp = {}
                    var lat = suburbCoordSet[i][1];
                    var lng = suburbCoordSet[i][0];
                    hashTemp['lat'] = lat;
                    hashTemp['lng'] = lng;
                    suburbHash.push(hashTemp)
                  }
                  return suburbHash
                }

                var newCoords = polygCoords(test_parsed)

                var newArea = new google.maps.Polygon({
                 paths: newCoords,
                 strokeColor: '#FF0000',
                 strokeOpacity: 0.8,
                 strokeWeight: 2,
                 fillColor: '#FF0000',
                 fillOpacity: 0.35
               });


               newArea.setMap(map)

            //    google.maps.event.addListener(newArea, 'click', function (event) {
            // alert(this.indexID);
            // });


              var marker = new google.maps.Marker({
                    position: { lat: lat, lng: lng },
                    map: map,
                    title: suburb.suburbName
                  });

                  marker.setVisible(false)
                  // instantiate marker on map
                  var infoWindow = new google.maps.InfoWindow(
                    {content: suburb.suburbName + '<br>' + 'Median house price: ' + suburb.housePrice + '<br>' + 'Median unit price: ' + suburb.unitPrice}
                   );
                  newArea.addListener('click', function() {
                    infoWindow.open(map, marker);



                });



              });
//copy of response


      }; //closes init function
      // initialize map
      initMap();
  });
