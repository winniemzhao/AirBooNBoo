import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ['popup']

  connect() {
    console.log("hello from alert")
    setTimeout(() => {
      this.popupTarget.click()
    }, 6000)
  }
}
