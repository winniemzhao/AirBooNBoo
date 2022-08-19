import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ['popup']

  connect() {
    console.log("hello from alert")
  }

  fade() {
    console.log("fadinggggg")

    const fadeOut = () => {
      console.log("displaying none")
      this.popupTarget.classList.add("d-none")
    };

    // const fadeOut = () => {
    //   this.popupTarget.classList.add("transition")
    //   console.log(" added transition")
    // }

    const myTimeout = setTimeout(fadeOut, 3000)

  }
}
