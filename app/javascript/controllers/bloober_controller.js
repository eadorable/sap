import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bloober"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  send(event) {
    event.preventDefault();
    console.log(event.currentTarget);
  }
}
