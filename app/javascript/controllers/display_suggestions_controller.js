import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-suggestions"
export default class extends Controller {

  static targets = ["form", "input", "abc", "list"];


  connect() {
    console.log("displaying suggestions..");
    console.log("list", this.listTarget);
  }

  send(){
    event.preventDefault()
    console.log("send..");
    console.log("input..", this.inputTarget);

    console.log("input 123..", this.inputTarget.value);

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log("url" , url);
    fetch(url, {
      headers: { "Accept": "text/plain" }
    })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }

}
