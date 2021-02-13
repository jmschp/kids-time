import mapboxgl from "!mapbox-gl";

function mapbox(elementId) {
  const mapElement = document.getElementById(elementId);
  if (mapElement) {
    mapboxgl.accessToken = process.env.MAPBOX_TOKEN;
    const map = new mapboxgl.Map({
      container: elementId, // container ID
      style: "mapbox://styles/mapbox/streets-v11", // style URL
      center: [-23, 46], // starting position [lng, lat]
      zoom: 1, // starting zoom,
      attributionControl: false,
    });
    addMarkers(mapElement, map);
  }
}

function addMarkers(mapElement, map) {
  const markers = JSON.parse(mapElement.dataset.markers);
  if (markers) {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      const markers = new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
      bounds.extend([marker.lng, marker.lat]);
      map.fitBounds(bounds, { padding: 100, maxZoom: 15, duration: 0 });
    });
  }
}

export { mapbox };
