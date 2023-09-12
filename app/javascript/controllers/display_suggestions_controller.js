import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-suggestions"
export default class extends Controller {
  connect() {
    console.log("displaying suggestions..");
  }

}
