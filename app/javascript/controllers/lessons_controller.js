import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'lesson' ];

  refresh() {
    console.log(event.currentTarget);
    fetch(`/lessons/${event.currentTarget.dataset.lessonId}`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
