import Siema from "siema";

function imageCarousel(cssSelector) {
  const imageCarousels = document.querySelectorAll(cssSelector);
  for (let imageCarousel of imageCarousels) {
    new Siema({ selector: imageCarousel });
  }
}

export { imageCarousel };
