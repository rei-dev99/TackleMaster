// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./tackles_new"

document.addEventListener("turbo:load", function() {
  new ScrollHint('.js-scrollable');
});
