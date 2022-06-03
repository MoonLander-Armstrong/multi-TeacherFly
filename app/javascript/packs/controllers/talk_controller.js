import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["opinion"];

  fight() {
    this.opinionTarget.value = "";
  }
}
