import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="payment"
export default class extends Controller {

  static targets = ["expiryDate"]

  connect() {
    console.log("payment controller");

    flatpickr(this.expiryDateTarget, {
      enableTime: false,
      dateFormat: "Y/m",
    })
  }
}
