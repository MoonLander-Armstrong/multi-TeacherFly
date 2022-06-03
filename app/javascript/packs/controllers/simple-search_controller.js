import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  clearSearchInput(e) {
    e.target.value = "";
  }
}
