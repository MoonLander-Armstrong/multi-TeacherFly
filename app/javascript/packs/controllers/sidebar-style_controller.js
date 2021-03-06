import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["courses", "comments", "lecturers", "users", "orders"]
  

  initialize(){
    const route = window.location.href.toString().split(window.location.host)[1] 
    const currentURL = window.location.href
    switch(currentURL){
      case this.coursesTarget.href:{
        this.coursesTarget.parentElement.classList.toggle("owner-current-page");
        break;
      }
      case this.commentsTarget.href:{
        this.commentsTarget.parentElement.classList.toggle("owner-current-page");
        break;
      }
      case this.lecturersTarget.href:{
        this.lecturersTarget.parentElement.classList.toggle("owner-current-page");
        break;
      }
      case this.usersTarget.href:{
        this.usersTarget.parentElement.classList.toggle("owner-current-page");
        break;
      }
      case this.ordersTarget.href:{
        this.ordersTarget.parentElement.classList.toggle("owner-current-page");
        break;
      }
    }

    if (route == '/owner/lecturers/new'){
      this.lecturersTarget.parentElement.classList.toggle("owner-current-page");
    }
  }
}
