import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-suggestions"
export default class extends Controller {

  static targets = ["form", "input", "abc", "list"];


  connect() {

  }

  send(){
    event.preventDefault()

    const loader = document.getElementById('loader');
    loader.style.display = 'block';

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log("url" , url);
    fetch(url, {
      headers: { "Accept": "text/plain" }
    })
    .then(response => response.text())
    .then((data) => {
      loader.style.display = 'none';
      this.listTarget.outerHTML = data
    })
    .catch((error) => {
      loader.style.display = 'none';
      console.error(error);
    })
  }

}
