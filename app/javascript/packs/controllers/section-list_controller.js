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

    // show sidebar in viewport size over md
    if (window.innerWidth > 768) {
      this.sectionDropdownTarget.classList.remove("fade");
    }
  }

  toggleSideBar() {
    this.sectionDropdownTarget.classList.toggle("fade");
  }

  setWidth({ detail }) {
    this.progressBarTarget.style.setProperty(
      "--progressBar-width",
      detail.progressBarWidth
    );
    this.progressTarget.textContent = detail.progressBarWidth;
  }

  endLoading() {
    this.loadingTarget.remove();
  }

  videoFinished() {
    const video = this.videoFinishedTarget;
    const { sendWidthEvent } = this.sectionTarget;
    const finishedIconTargets = Array.from(this.finishedIconTargets);
    const unfinishedIconTargets = Array.from(this.unfinishedIconTargets);

    const data = new FormData();
    data.append("finished", true);
    data.append("sectionId", `${video.dataset.sectionId}`);

    const finishedIconTarget = finishedIconTargets.find(
      (finishedIcon) =>
        finishedIcon.dataset.sectionId == video.dataset.sectionId
    );
    const unfinishedIconTarget = unfinishedIconTargets.find(
      (unfinishedIcon) =>
        unfinishedIcon.dataset.sectionId == video.dataset.sectionId
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
