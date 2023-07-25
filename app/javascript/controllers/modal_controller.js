import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "trigger", "overlay", "autofocus" ]

  connect() {
    this.triggerTarget.addEventListener("click", this.showModal.bind(this))
  }

  showModal() {
    this.overlayTarget.classList.add("!flex");
    this.autofocusTarget.focus();
  }

  hide() {
    this.overlayTarget.classList.remove("!flex");
  }

  stopBubble(event) {
    event.stopPropagation();
  }
}
