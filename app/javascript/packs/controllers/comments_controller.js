import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input"];

  connect(){
      document.querySelectorAll(".tag").forEach((e)=>{
      e.addEventListener("click", ()=>{
        e.parentElement.parentElement.nextElementSibling.classList.toggle("hidden")
      })
    })
  }

  toggle() {
    // this.formTarget.classList.toggle("hidden");
    // this.inputTarget.focus()
 
  }

  send() {
    this.formTarget.classList.add("hidden");
  }
}
