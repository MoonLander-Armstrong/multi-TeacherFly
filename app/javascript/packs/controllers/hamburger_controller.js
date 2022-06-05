import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["navbar", "button"];
  static values = {
    show: Boolean,
  };

  initialize() {
    this.show = false;
  }

  toggleNavBar() {
    this.showValue = !this.showValue;
  }

  showValueChanged(current) {
    if (current) {
      this.element.parentElement.style.height = "440px";
      this.navbarTarget.classList.toggle("hidden");
    } else {
      this.element.parentElement.style.height = "88px";
      this.navbarTarget.classList.toggle("hidden");
    }
  }

  layout() {
    this.element.parentElement.style.height = "88px";
    this.showValue = false;
  }
}
