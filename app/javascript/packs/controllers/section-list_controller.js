import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "sectionDropdown",
    "loading",
    "loadingCircle",
    "progressBar",
    "progress",
  ];

  connect() {
    // progressbarWidth
    this.progressBarTarget.style.setProperty(
      "--progressBar-width",
      `${this.progressBarTarget.dataset.progressbar}%`
    );

    // loading block
    function addDot(target) {
      let dotArr = target.textContent.split("g")[1];
      if (dotArr.length === 3) {
        target.textContent = "Loading";
        return;
      }
      target.textContent += ".";
    }

    const intervalTimer = setInterval(() => {
      addDot(this.loadingCircleTarget);
    }, 300);

    setTimeout(() => {
      clearInterval(intervalTimer);
      const modal = this.loadingTarget.children[0];
      const circle = this.loadingTarget.children[1];
      this.loadingTarget.removeChild(modal);
      this.loadingTarget.removeChild(circle);
    }, 2000);
  }

  toggleSideBar() {
    this.sectionDropdownTarget.classList.toggle("fade");
    this.sectionDropdownTarget.classList.toggle("show");
  }

  viewportResize() {
    if (window.screen.width > 767) {
      this.sectionDropdownTarget.classList.remove("fade");
      this.sectionDropdownTarget.classList.remove("show");
    } else {
      this.sectionDropdownTarget.classList.add("fade");
    }
  }

  setWidth({ detail }) {
    this.progressBarTarget.style.setProperty(
      "--progressBar-width",
      detail.progressBarWidth
    );
    this.progressTarget.textContent = detail.progressBarWidth;
  }
}
