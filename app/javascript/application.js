// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.getElementById('user-menu-button').addEventListener('click', function () {
  const dropdown = document.getElementById('user-dropdown');
  dropdown.classList.toggle('hidden');
});