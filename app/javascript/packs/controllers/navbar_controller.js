import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["navList", "dropdownList"];

  initialize() {
    this.dropdownListShowed = false;
  }

  toggleNavList() {
    this.navListTarget.classList.toggle("fade");
  }

  toggleDropdownList(e) {
    e.stopPropagation();
    const removeDropdownList = () => {
      this.dropdownListTarget.classList.add("hidden");
      this.dropdownListShowed = !this.dropdownListShowed;
      window.removeEventListener("click", removeDropdownList);
    };

    if (this.dropdownListShowed) {
      this.dropdownListTarget.classList.add("hidden");
      this.dropdownListShowed = !this.dropdownListShowed;
    } else {
      this.dropdownListTarget.classList.remove("hidden");
      this.dropdownListShowed = !this.dropdownListShowed;
      window.addEventListener("click", removeDropdownList);
    }
  }
}
