import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {

    setTimeout (() => {
      this.element.classList.add("!translate-y-0");
    }, 0);

    setTimeout(() => {
      this.element.classList.add("opacity-0")
    }, 2500)

    setTimeout(() => {
      this.element.classList.add("hidden");
    }, 3000);
  }
}
