import { Controller } from "@hotwired/stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [
    "sectionDropdown",
    "loading",
    "progressBar",
    "progress",
    "videoFinished",
    "section",
    "finishedIcon",
    "unfinishedIcon",
  ];

  initialize() {
    const sendWidth = new CustomEvent("sendWidth", {
      detail: { progressBarWidth: "0%" },
    });
    this.sectionTarget.sendWidthEvent = sendWidth;
  }

  connect() {
    // progressbarWidth
    this.progressBarTarget.style.setProperty(
      "--progressBar-width",
      `${this.progressBarTarget.dataset.progressbar}%`
    );

    // loading block
    setTimeout(() => {
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

  videoFinished() {
    const video = this.videoFinishedTarget;
    const { sendWidthEvent } = this.sectionTarget;
    const finishedIconTargets = Array.from(this.finishedIconTargets);
    const unfinishedIconTargets = Array.from(this.unfinishedIconTargets);

    const data = new FormData();
    data.append("finished", true);
    data.append("sectionId", `${video.dataset.sectionId}`);

    var finishedIconTarget = finishedIconTargets.find(
      (e) => e.dataset.sectionId == video.dataset.sectionId
    );
    var unfinishedIconTarget = unfinishedIconTargets.find(
      (e) => e.dataset.sectionId == video.dataset.sectionId
    );

    Rails.ajax({
      url: `/api/v1/courses/${video.dataset.courseId}/sections/${video.dataset.sectionSlugId}/finished`,
      type: "patch",
      data,
      success: function ({ progress, finished }) {
        if (finished[0]) {
          finishedIconTarget.classList.remove("hidden");
          unfinishedIconTarget.classList.add("hidden");
        } else {
          finishedIconTarget.classList.add("hidden");
          unfinishedIconTarget.classList.remove("hidden");
        }
        sendWidthEvent.detail.progressBarWidth = progress;
        document.dispatchEvent(sendWidthEvent);
      },
    });
  }
}
