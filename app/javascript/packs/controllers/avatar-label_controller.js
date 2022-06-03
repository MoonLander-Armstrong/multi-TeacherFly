import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fileInput", "preview", "fakeImg"];

  initialize() {
    this.reader = new FileReader();
  }

  loadImg() {
    if (this.fileInputTarget.files) {
      this.reader.addEventListener("load", () => {
        this.previewTarget.src = this.reader.result;
        this.fakeImgTarget.classList.add("hidden");
        this.previewTarget.classList.remove("hidden");
      });
      this.reader.readAsDataURL(this.fileInputTarget.files[0]);
    }
  }
}
