window.googleMapConfig = {} //GLOBAL MAP SETTING

// // function getHttpData() {
// //   let url = 'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-061?Authorization=CWB-087E3910-726F-4E71-9EBC-12CE90A48A57&limit=12&offset=1&locationName=%E5%8C%97%E6%8A%95%E5%8D%80,%E5%A3%AB%E6%9E%97%E5%8D%80,%E5%85%A7%E6%B9%96%E5%8D%80,%E4%B8%AD%E5%B1%B1%E5%8D%80,%E5%A4%A7%E5%90%8C%E5%8D%80,%E6%9D%BE%E5%B1%B1%E5%8D%80,%E5%8D%97%E6%B8%AF%E5%8D%80,%E4%B8%AD%E6%AD%A3%E5%8D%80,%E8%90%AC%E8%8F%AF%E5%8D%80,%E4%BF%A1%E7%BE%A9%E5%8D%80,%E5%A4%A7%E5%AE%89%E5%8D%80,%E6%96%87%E5%B1%B1%E5%8D%80'
// //   fetch(url)
// //     .then(function (res) {
// //       if (res.status === 200)
// //         return res.json();
// //     })
// //     .then(function (data) {
// //       if (data.success) {
// //         for (let key in data.records.locations) {
// //           initMapMarker(data.records.locations[key].location);
// //         }
// //       }
// //     })
// //     .catch(function (err) {
// //       console.log(err);
// //     })
// // }

function getLocationData(data) {
  console.log("result"+data)
  var array = data
  let locations = []
  
  // console.log(array[0])
  for (var j = 0; j < array.length; j++) {
    locations.push([array[j].infowindow, array[j].lat, array[j].lng])
  }
  
  return locations
}

function initMapMarker(data) {
  /*
  1.get台北市氣象資料
  2.將12區地址轉經緯度後放進陣列後下marker
  3.12區細節資料塞到marker info內
  */

  let locations = data
  
  let marker, i


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
          contentString = setHTMLmethod(parseWeather(locations[i][3]), locations[i][0])
          window.googleMapConfig.infowindow.setContent(contentString)
          window.googleMapConfig.infowindow.open(map, marker)
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

// // function setHTMLmethod(str, title) {
// //   let contentString = '<div id="content">' +
// //     '<div id="siteNotice">' +
// //     '</div>' +
// //     '<h1 id="firstHeading" class="firstHeading">' + title + '</h1>' + str +
// //     '</div>' +
// //     '</div>';
// //   return contentString;
// // }

// // function parseWeather(data) {
// //   newArray = [];
// //   str = '';
// //   for (let i in data) {
// //     str += `${parseOneAeraWeatherElement(data[i].time[i], data[i].description)}`
// //   }
// //   return str;
// // }

// // // function parseOneAeraWeatherElement(data, title) {
// // //   array = []
// // //   str = ''
// // //   str += `<p class="info-box__span">${title}`;
// // //   for (let i in data) {
// // //     for (var j = 0; j < data[i].length; j++) {
// // //       var info = data[i][j];
// // //       console.log(info);
// // //       if(info.measures === '自定義 Wx 文字'){//天氣現象
// // //         array.push(info)
// // //         str += ` :${info.value}</p>`;
// // //         break;
// // //       }else if (info.measures === '攝氏度') {//體感溫度,溫度
// // //         array.push(info)
// // //         str += ` ${info.value}:${info.measures}</p>`;
// // //         break;
// // //       } else if (info.measures === '百分比') {//"12小時降雨機率",相對濕度
// // //         str += ` ${info.measures}:${info.value}</p>`;
// // //         array.push(info)
// // //         break;
// // //       } else if (info.measures === 'NA') {//"天氣預報綜合描述"
// // //         str += ` :${info.value}</p>`;
// // //         array.push(info)
// // //         break;
// // //       } else if (info.measures === '公尺/秒') {//""風速""
// // //         str += ` ${info.value}: ${info.measures}</p>`;
// // //         array.push(info)
// // //         break;
// // //       } else if (info.measures === '16方位') {//"""風向"""
// // //         str += ` :${info.value}</br></p>`;
// // //         array.push(info)
// // //         break;
// // //       }
// // //     }
// // //   }
// // //   return str;
// // // }

// function goStart() {
//   setMapStyle();
// //   getHttpData();
// }



// window.onload = goStart();
