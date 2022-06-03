import { Controller } from "@hotwired/stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["finishedIcon", "unfinishedIcon"];

  initialize() {
    const sendWidth = new CustomEvent("sendWidth", {
      detail: { progressBarWidth: "0%" },
    });
    this.sendWidthEvent = sendWidth;
  }

  toggleFinished(e) {
    const { finishedIconTarget, unfinishedIconTarget, sendWidthEvent } = this;
    const data = new FormData();
    data.append("finished", `${e.target.checked}`);
    data.append("sectionId", `${this.element.dataset.sectionId}`);

    Rails.ajax({
      url: `/api/v1/courses/${this.element.dataset.courseId}/sections/${this.element.dataset.sectionSlugId}/finished`,
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
