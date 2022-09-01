import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["infos", "form"]

  displayForm() {
    // this.infosTarget.classList.add("d-none")
    this.formTarget.classList.toggle("d-none")
    console.log('works')
  }
}
