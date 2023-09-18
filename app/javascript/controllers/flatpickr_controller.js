import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "dateFrom", "dateTo" ]

  connect() {
    console.log("flatpickr");
    flatpickr(this.dateFromTarget, {
      enableTime: false
    })
    flatpickr(this.dateToTarget, {
      enableTime: false
    })
  }
}
