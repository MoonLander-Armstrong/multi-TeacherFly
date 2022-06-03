import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  closeFlash() {
    this.element.remove();
  }
}
