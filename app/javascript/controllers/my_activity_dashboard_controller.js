import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="my-activity-dashboard"
export default class extends Controller {
  static targets = ["dropdown"]
  connect() {
    // console.log("Hello, from my-activity-dashboard controller!")

  }
  showMyActivity() {
    this.dropdownTarget.classList.toggle("d-none");
  }


}
