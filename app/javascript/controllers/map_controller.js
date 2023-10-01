import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    currentlocation: Object
  }

  static targets = ["content", "insertlocations"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const contentElement = this.contentTarget;

    this.map = new mapboxgl.Map({
      container:contentElement,
      style: "mapbox://styles/mapbox/streets-v10",
      scrollZoom: false
    })

    this.#displayMapData()
    this.#fitMapToMarkers()
  }


  async #displayMapData(){
    const results = await this.#addMarkersToMap()

    const carImageSrc ='/assets/car1.png';

    const sorted_locations = results.sort((a, b) => {
      return a.distance - b.distance;
    });
    for (const location of sorted_locations) {
      const data = `<h5 class="map-headers-locations">
                      <span class = "map-location-name"> ${location.address} </span>
                      <img style="width:25px" src="${carImageSrc}" alt="Car Image" class="car-image" >
                      Driving distance is
                        <span class = "map-location-details"> <strong> ${location.distance} </strong>  km</span> and may take about
                        <span class = "map-location-details"> <strong>${location.duration} </strong>  mins</span>
                    </h5>`;
      this.insertlocationsTarget.insertAdjacentHTML('beforeend', data);
    }

    console.log("sorted_locations", sorted_locations);

  }

  async #addMarkersToMap() {

    const locationDetails = [];
    const companyLocation = this.currentlocationValue;
    const startingPoint = [companyLocation.lng,companyLocation.lat];

    for (const marker of this.markersValue){
      const coords = [marker.lng, marker.lat];
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${startingPoint.join(',')};${coords.join(',')}?access_token=${this.apiKeyValue}`;
      const response = await fetch(url);
      const data = await response.json();
      const distanceKm = Math.round(data.routes[0].distance / 1000);
      const durationMin = Math.round(data.routes[0].duration / 60);
      locationDetails.push({distance:distanceKm, duration: durationMin, address: marker.add});

      // customMarker.innerHTML += `<p class= "map-location-details" >Distance: ${distanceKm} km Duration: ${durationMin} mins <p>`;

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      const companyMarker = document.createElement("div")
      companyMarker.innerHTML = companyLocation.marker_html
      new mapboxgl.Marker(companyMarker)
      .setLngLat([ companyLocation.lng, companyLocation.lat ])
      .addTo(this.map)
    }
    return locationDetails
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 })
  }
}
