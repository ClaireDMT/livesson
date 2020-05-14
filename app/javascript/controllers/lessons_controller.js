//= require moment
//= require moment/fr.js
import { Controller } from "stimulus";
import { toggleLesson } from '../plugins/toggle_lesson';

export default class extends Controller {
  static targets = [ 'lesson' ];

  refresh() {
    // fetch(`/lessons/${event.currentTarget.dataset.lessonId}`, { headers: { accept: "application/json" } })
    fetch(`/lessons/reservation_lesson/${event.currentTarget.dataset.lessonId}`)
      .then(response => response.text())
      .then((data) => {
        const moment = require('moment');
        moment.locale('fr');
        this.lessonTarget.innerHTML = data;
        document.getElementById('show-lesson-container').style.display = "block";
        toggleLesson();
      });
  }
}
