import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    // mapCenterLatitude: Number,
    // mapCenterLongitude: Number,
  }
  static targets = ["map"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({

      // contrainer: this.mapTarget,
      container: this.element,
      style: "mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb",
      // center: [this.mapCenterLongitudeValue, this.mapCenterLatitudeValue],
      // zoom: 14
    })

    this.#addMarkersToMap() // Call the method to add markers
    this.#fitMapToMarkers() // Call the method to fit the map to markers
    this.setupGeocoder();

    // Add Mapbox Geocoder control to the map
    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
      })
    );
  }

  setupGeocoder() {
    const geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    });

    geocoder.addTo(this.map);

    geocoder.on("result", (event) => this.searchByAddress(event.result.place_name));
    geocoder.on("clear", () => this.resetMap());
  }

  searchByAddress(address) {
    // Clear the existing markers on the map
    this.clearMarkers();

    // Perform an AJAX request to fetch activities based on the address
    fetch(`/activities?search[query]=${encodeURIComponent(address)}`)
      .then((response) => response.json())
      .then((data) => {
        // Data should contain activities based on the provided address
        // Loop through the data and add markers for each activity
        data.forEach((activity) => {
          this.addMarker(activity);
        });

        // Adjust the map to fit all the new markers
        this.fitMapToMarkers();
      })
      .catch((error) => {
        console.error("Error fetching activities:", error);
      });
  }

  resetMap() {
    // Clear the existing markers and reset the map to its initial state
    this.clearMarkers();
    this.fitMapToMarkers(); // Fit the map to the initial markers
  }

  clearMarkers() {
   // Remove all existing markers from the map
  this.mapMarkers.forEach((marker) => {
    marker.remove(); // Remove the marker from the map
  });

  // Clear the array of markers
  this.mapMarkers = [];
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      const address = marker.address;

      const popup = new mapboxgl.Popup().setHTML(`<h2>${marker.address}</h2>`);

       // Create a HTML element for your custom marker
    const customMarker = document.createElement("div");
    customMarker.innerHTML = marker.marker_html;

        // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
