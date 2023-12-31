import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="venuemap"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array,
    currentlocation: Object,
    venuelocation: Object
  }

  static targets = ["content"]

  connect() {
    console.log("venuemap");
    mapboxgl.accessToken = this.apiKeyValue
    const contentElement = this.contentTarget;

    this.map = new mapboxgl.Map({
      container: contentElement,
      style: "mapbox://styles/mapbox/streets-v12",
      scrollZoom: false
      // style: "mapbox://styles/mapbox/satellite-streets-v12"

    })

    this.map.addControl(new mapboxgl.NavigationControl());

    this.#showMapData()
    this.#fitMapToMarkers()
    this.#addMarkersToMap()
  }

  async #addMarkersToMap() {
    const companyLocation = this.currentlocationValue;
    const venueLocation = this.venuelocationValue;

    const customMarker = document.createElement("div")
    customMarker.innerHTML = venueLocation.marker_html


    const startingPoint = [companyLocation.lng, companyLocation.lat];
    const endingPoint = [venueLocation.lng, venueLocation.lat];
    const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${startingPoint.join(',')};${endingPoint.join(',')}?access_token=${this.apiKeyValue}`;
    const response = await fetch(url);
    const data = await response.json();
    const distanceKm = Math.round(data.routes[0].distance / 1000);
    const durationMin = Math.round(data.routes[0].duration / 60);

    customMarker.innerHTML += `<p class= "map-location-venue" >${distanceKm} km - ${durationMin} mins`;

    new mapboxgl.Marker(customMarker)
    .setLngLat([venueLocation.lng, venueLocation.lat])
    .addTo(this.map)

    const companyMarker = document.createElement("div")
    companyMarker.innerHTML = companyLocation.marker_html
    new mapboxgl.Marker(companyMarker)
      .setLngLat([companyLocation.lng, companyLocation.lat])
      .addTo(this.map)
  }

  #showMapData() {
    const coordinates = []
    const companyLocation = this.currentlocationValue;
    const startingPoint = [companyLocation.lng, companyLocation.lat];
    const venueLocation = this.venuelocationValue;
    const endingPoint = [venueLocation.lng, venueLocation.lat];

    const url1 = `https://api.mapbox.com/directions/v5/mapbox/driving/${startingPoint.join(',')};${endingPoint.join(',')}?alternatives=true&geometries=geojson&language=en&overview=full&steps=true&access_token=${this.apiKeyValue}`;

    fetch(url1)
      .then(response1 => response1.json())
      .then(data1 => {
        const geo = data1.routes[0].geometry;
        geo.coordinates.forEach(val => {
          coordinates.push([val[0], val[1]])
        })

        if (this.map.loaded()) {
          const geojson = {
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'LineString',
              coordinates: coordinates
            }
          };

          // Add your sources and layers here
          this.map.addSource('route', {
            type: 'geojson',
            data: geojson
          });

          this.map.addLayer({
            id: 'route',
            type: 'line',
            source: 'route',
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': '#0074D9',
              'line-width': 4
            }
          });
        }
        else {

          this.map.on("load", () => {

            const geojson = {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'LineString',
                coordinates: coordinates
              }
            };

            // Add your sources and layers here
            this.map.addSource('route', {
              type: 'geojson',
              data: geojson
            });

            this.map.addLayer({
              id: 'route',
              type: 'line',
              source: 'route',
              layout: {
                'line-join': 'round',
                'line-cap': 'round'
              },
              paint: {
                'line-color': '#0074D9',
                'line-width': 4
              }
            });
          });
        }

      })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    const companyLocation = this.currentlocationValue;
    const venueLocation = this.venuelocationValue;

    bounds.extend([companyLocation.lng, companyLocation.lat]);
    bounds.extend([venueLocation.lng, venueLocation.lat]);
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 13, duration: 0 })
  }

}
