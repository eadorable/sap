import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log(this.element)
    // flatpickr(this.element)
    flatpickr(this.element, {
      enableTime: true, // Enable time selection
      dateFormat: 'l, F j, h:i K' , // Format for date and time
    });
  }
}

// other date and time formats can be found here: https://flatpickr.js.org/formatting/
