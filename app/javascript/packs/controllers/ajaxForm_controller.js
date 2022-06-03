import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input"];

  toggle() {
    this.formTarget.classList.toggle("hidden");
    this.inputTarget.focus()
  }

  send() {
    this.formTarget.classList.add("hidden");
  }
}
