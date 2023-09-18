import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "openingTime", "closingTime" ]

  connect() {
    console.log("flatpickr");
    flatpickr(this.openingTimeTarget, {
      enableTime: true
    })
    flatpickr(this.closingTimeTarget, {
      enableTime: true
    })
  }
}
