import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

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
      // this.listTarget.outerHTML = data


      var typed = new Typed(this.listTarget, {
        strings: [data],
        typeSpeed: 5,
        // smartBackspace: true,
        onComplete: function(self) { self.cursor.remove() }
      });

    })
    .catch((error) => {
      loader.style.display = 'none';
      console.error(error);
    })
  }

}
