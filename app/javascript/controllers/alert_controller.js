import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    console.log("alert controller ");
  }

  initSweetalert(event) {
    event.preventDefault();
    console.log("initSweetalert");

    let alertContainer = document.getElementById("alert-container");
    alertContainer.style.display = 'block'


    setTimeout(() => {
      console.log("submitting...");

      const form = this.element;
      form.submit();
      alertContainer.style.display = 'none'

    }, 10000);
  }
}
