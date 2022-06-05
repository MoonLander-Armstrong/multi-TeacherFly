import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage"

export default class extends Controller {
  static targets = ["progressbar", "mediaInput"]

  upload(){
    const uploader = new Uploader(this.mediaInputTarget.files[0], this.url);
    uploader.start()
    console.log(uploader);
    document.getElementById("uploadfilename").textContent = uploader.file.name
    this.mediaInputTarget.value = null
  }


  get url(){
    return this.mediaInputTarget.dataset.directUploadUrl
  }
}


class Uploader {
  constructor(file, url) {
    this.uploader = new DirectUpload(file, url, this)
    this.file = file
    this.url = url
  }

  start() {
    this.uploader.create((error, blob) => {
      if (error) {
        // Handle the error
      } else {
        const hiddenField = document.createElement('input')
        const input = document.getElementById('section_media')
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("value", blob.signed_id);
        hiddenField.name = input.name
        document.querySelector('.form').appendChild(hiddenField)
      }
    })
  }


  directUploadWillStoreFileWithXHR(request) {
    console.log(request);
    request.upload.addEventListener("progress",
      event => this.directUploadDidProgress(event))
    request.upload.addEventListener("loadend",
      event => this.directUploadDidEnd(event))
    request.upload.addEventListener("error",
      event => this.directUploadDidError(event))
  }

  directUploadDidProgress(event) {
    // Use event.loaded and event.total to update the progress bar
    document.getElementById("upload-progressbar").style.width = `${Math.round((event.loaded / event.total)* 100)}%`
    document.getElementById("progressPercent").textContent = `${Math.round((event.loaded / event.total)* 100)}%`
  }

  directUploadDidEnd() {
    document.getElementById("progressPercent").innerHTML = `
      <i class="fa-solid fa-circle-check text-green-500 text-xl"></i>
    `
  }
  directUploadDidError() {
    document.getElementById("progressPercent").innerHTML = `
    <i class="fa-solid fa-circle-xmark text-red-500 text-xl"></i>
    `
  }
}