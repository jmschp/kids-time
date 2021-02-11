import mapboxgl from "!mapbox-gl";

function mapbox(token) {
  mapboxgl.accessToken = token;
  const map = new mapboxgl.Map({
    container: "map", // container ID
    style: "mapbox://styles/mapbox/streets-v11", // style URL
    center: [-74.5, 40], // starting position [lng, lat]
    zoom: 9, // starting zoom,
    attributionControl: false,
  });
}

export { mapbox };