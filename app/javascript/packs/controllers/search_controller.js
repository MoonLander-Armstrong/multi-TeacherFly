import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["option", "button"]
  
  showOption(){
    this.optionTarget.classList.toggle("invisible")
  }
}