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
    zoom: 11,
    center: { lat: data[0][1], lng: data[0][2] },
    styles: [
      { elementType: 'geometry', stylers: [{ color: '#242f3e' }] },
      { elementType: 'labels.text.stroke', stylers: [{ color: '#242f3e' }] },
      { elementType: 'labels.text.fill', stylers: [{ color: '#746855' }] },
      {
        featureType: 'administrative.locality',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#d59563' }],
      },
      {
        featureType: 'poi',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#d59563' }],
      },
      {
        featureType: 'poi.park',
        elementType: 'geometry',
        stylers: [{ color: '#263c3f' }],
      },
      {
        featureType: 'poi.park',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#6b9a76' }],
      },
      {
        featureType: 'road',
        elementType: 'geometry',
        stylers: [{ color: '#38414e' }],
      },
      {
        featureType: 'road',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#212a37' }],
      },
      {
        featureType: 'road',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#9ca5b3' }],
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry',
        stylers: [{ color: '#746855' }],
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#1f2835' }],
      },
      {
        featureType: 'road.highway',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#f3d19c' }],
      },
      {
        featureType: 'transit',
        elementType: 'geometry',
        stylers: [{ color: '#2f3948' }],
      },
      {
        featureType: 'transit.station',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#d59563' }],
      },
      {
        featureType: 'water',
        elementType: 'geometry',
        stylers: [{ color: '#17263c' }],
      },
      {
        featureType: 'water',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#515c6d' }],
      },
      {
        featureType: 'water',
        elementType: 'labels.text.stroke',
        stylers: [{ color: '#17263c' }],
      },
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

