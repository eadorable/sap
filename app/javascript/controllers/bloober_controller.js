import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bloober"
export default class extends Controller {
  connect() {

  }

  send(event) {
    event.preventDefault();
    console.log(event.currentTarget);
  }
}
