import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["avatarButton", "hamburgerButton"];

  initialize() {
    this.avatarShow = false;
    this.hamburgerShow = false;
  }

  hiddenAvatar() {
    this.hamburgerShow = !this.hamburgerShow;
    this.avatarButtonTarget.classList.toggle("hidden");
  }

  hiddenHamburger() {
    this.avatarShow = !this.avatarShow;
    this.hamburgerButtonTarget.classList.toggle("hidden");
  }
}
