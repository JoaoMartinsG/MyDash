import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-switch"
export default class extends Controller {
  static targets = ["list"]
  connect() {
    console.log('Welcome to your dashboard , this is not an easter egg')
  }

  toggle() {
    this.listTargets.forEach((list) => {
      list.classList.toggle('d-none')
    })
  }
}
