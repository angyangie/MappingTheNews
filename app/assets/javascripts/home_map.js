
var map;

var initMap = function() {
  mapboxgl.accessToken = 'pk.eyJ1IjoiYW5neWFuZ2llIiwiYSI6ImNpb3pxdzVlNzAyNTR0aG00Y2thcmM2NzcifQ.tZYMnHPi7VJu077p4EyNfA'

        map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/angyangie/ciozr0p53000lbvm60fu356jf',
          center: [0, 40], // starting position
          zoom: 2.2 // starting zoom
      });

  //load state layer
  map.on('load', function () {
      map.addSource('states', {
          'type': 'geojson',
          'data': 'https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_110m_admin_1_states_provinces_shp.geojson'
      });

    map.addLayer({
        'id': 'states-layer',
        'type': 'fill',
        'source': 'states',
        'paint': {
            'fill-color': 'rgba(212, 206, 214, 0.35)',
            'fill-outline-color': 'rgba(0, 0, 0, 1)'
        }
    });
});

  map.on('click', function(e){
alert("Click?")
//country labels
    var country_features = map.queryRenderedFeatures(e.point, {layers: ['countries (1)']});

    var countries = []

    var country_labels = country_features.forEach(function(country){
      countries.push(country.properties.name)
    })

    map.getCanvas().style.cursor = (country_features.length) ? 'pointer' : '';

    console.log(countries[0])

//state labels
    var state_features = map.queryRenderedFeatures(e.point, { layers: ['state-label-lg'] })

    var states = []

    var state_labels = state_features.forEach(function(state){
      states.push(state.properties.name)
    })
    
    console.log(states[0])

    if (states[0]) {
    var popup = new mapboxgl.Popup()
        .setLngLat(map.unproject(e.point))
        .setHTML(states[0])
        .addTo(map);
      }


  $.ajax({
    type: "GET",
    url: "/countries/" + countries[0],
    dataType: "JSON"
    }).done(function(response){

      var list_of_articles = []

      list_of_articles.push("<strong><a href='http://localhost:3000/countries/" + countries[0] + "'>" + countries[0] + "</a><strong><ul>")

      response.forEach(function(article){
        list_of_articles.push(
          "<li><a href='" + article.url + "'>" + article.title + "</a></li>"
          )
      })

      list_of_articles.push("</ul>")

      var html_articles_string = list_of_articles.join("")


    if (countries[0] && !states[0]) {
    var popup = new mapboxgl.Popup()
        .setLngLat(map.unproject(e.point))
        .setHTML(html_articles_string)
        .addTo(map);

      }
    })
  })

    

}
$(document).ready(function() {
  initMap();
})

