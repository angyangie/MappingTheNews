var map;

//Load map 
var initMap = function() {
  mapboxgl.accessToken = 'pk.eyJ1IjoiYW5neWFuZ2llIiwiYSI6ImNpb3pxdzVlNzAyNTR0aG00Y2thcmM2NzcifQ.tZYMnHPi7VJu077p4EyNfA'

        map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/angyangie/ciozr0p53000lbvm60fu356jf'
      });

//Country divisions layer 
// var createCountryDivisions = function() {
//    $.ajax({
//       dataType: "JSON",
//       url: '/countries/json'
//     }).done(function(response){
//      var country_layer = JSON.parse(response)
//      map.addSource("countries", country_layer)
//      map.addLayer({
//           "id": "countries",
//           "type": "fill",
//           "source": "countries",
//           "interactive": true,
//             "layout": {
//                 "visibility": "visible"
//             }
//         })
//     })
//   }

  map.on('click', function(e){
    var country_features = map.queryRenderedFeatures(e.point, {layers: ['countries (1)']});

    map.getCanvas().style.cursor = (country_features.length) ? 'pointer' : '';
   
    // var state = map.queryRenderedFeatures(e.point, { layers: ['state-label-lg'] })

    var countries = []

    var country_labels = country_features.forEach(function(country){
      countries.push(country.properties.name)
    })
    // var stateLabel = state.properties.name

    console.log(countries[0])

    debugger; 
    
    var popup = new mapboxgl.Popup()
        .setLngLat(map.unproject(e.point))
        .setHTML(countries[0])
        .addTo(map);


  })

  //Loads Country division layer 
  // map.on("load", function(){
  //   createCountryDivisions();
  // })


}
$(document).ready(function() {
  initMap();
})

