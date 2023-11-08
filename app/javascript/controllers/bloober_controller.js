import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bloober"
export default class extends Controller {
  static targets = ["button", "dropdown"]
  connect() {
    // console.log("Hello, Stimulus!", this.element);
    // console.log(this.Demo1Target);
  }

  send(event) {
    event.preventDefault();
    console.log(event.currentTarget);
  }

  myFunction() {
    console.log("hello", this.currentTarget);
    this.dropdownTarget.classList.toggle("d-none");
  }
}
