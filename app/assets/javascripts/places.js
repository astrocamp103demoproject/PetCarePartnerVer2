window.googleMapConfig = {} //GLOBAL MAP SETTING

function getLocationData(data) {
  var array = data
  let locations = []
  
  for (var j = 0; j < array.length; j++) {
    locations.push([array[j].infowindow, array[j].lat, array[j].lng,array[j].picture, array[j].marker_title, array[j].id, array[j].email, array[j].price ])
  }
  
  return locations
}

function initMapMarker(data) {

  let locations = data
  let marker, i
  let lastIndex = 0;


  for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: window.googleMapConfig.map,
    })
    google.maps.event.addListener(
      marker,
      'click',
      (function(marker, i) {
        return function() {

           contentString = setHTMLmethod(locations[i][0],locations[i][4],locations[i][6],locations[i][5],locations[i][3],locations[i][7])
           window.googleMapConfig.infowindow.setContent(contentString)
           window.googleMapConfig.infowindow.open(map, marker)
          //  console.log($(".search-sitters").scrollTop()+" px")
 
          if(lastIndex != locations[i][5]){
            let index = '#'+locations[i][5]
            $('.search-sitters').animate({
              scrollTop: ($(index).offset().top)
            },700);
              console.log(locations[i][5]+" ID form marker ")
              lastIndex = locations[i][5]
          }
        

    
        }
      })(marker, i)
    )
  }
}



function setMapStyle(data) {
  
  window.googleMapConfig.infowindow = new google.maps.InfoWindow()

  window.googleMapConfig.map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: { lat: data[0][1], lng: data[0][2] },
    styles: [
      {
          "featureType": "landscape",
          "stylers": [
              {
                  "hue": "#FFA800"
              },
              {
                  "saturation": 0
              },
              {
                  "lightness": 0
              },
              {
                  "gamma": 1
              }
          ]
      },
      {
          "featureType": "road.highway",
          "stylers": [
              {
                  "hue": "#53FF00"
              },
              {
                  "saturation": -73
              },
              {
                  "lightness": 40
              },
              {
                  "gamma": 1
              }
          ]
      },
      {
          "featureType": "road.arterial",
          "stylers": [
              {
                  "hue": "#FBFF00"
              },
              {
                  "saturation": 0
              },
              {
                  "lightness": 0
              },
              {
                  "gamma": 1
              }
          ]
      },
      {
          "featureType": "road.local",
          "stylers": [
              {
                  "hue": "#00FFFD"
              },
              {
                  "saturation": 0
              },
              {
                  "lightness": 30
              },
              {
                  "gamma": 1
              }
          ]
      },
      {
          "featureType": "water",
          "stylers": [
              {
                  "hue": "#00BFFF"
              },
              {
                  "saturation": 6
              },
              {
                  "lightness": 8
              },
              {
                  "gamma": 1
              }
          ]
      },
      {
          "featureType": "poi",
          "stylers": [
              {
                  "hue": "#679714"
              },
              {
                  "saturation": 33.4
              },
              {
                  "lightness": -25.4
              },
              {
                  "gamma": 1
              }
          ]
      }
  ],
  })
}

function setHTMLmethod(address,name,email,id,pic,price) {
  let contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
    
    '<p id="firstHeading" class="firstHeading">' + name + '</p>' +
    '<p >'+ address +'</p>'+
    '<p >'+ email +'</p>'+
    '<p >'+ id +'</p>'+
    // '<p >'+ price +" NTD"+'</p>'+
    // '<img src='+pic+'>'+
    '</div>' +
    '</div>';
  return contentString;
}

