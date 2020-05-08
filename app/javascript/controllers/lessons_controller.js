//= require moment
//= require moment/fr.js
import { Controller } from "stimulus";


export default class extends Controller {
  static targets = [ 'lesson' ];

  refresh() {
    fetch(`/lessons/${event.currentTarget.dataset.lessonId}`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        const moment = require('moment');
        moment.locale('fr');
        document.getElementById('show-lesson').style.display = "block";
        document.getElementById('new_booking').action = `/lessons/${data.lesson.id}/bookings`;
        document.getElementById('new_booking').action = `/lessons/${data.lesson.id}/bookings`;
        document.querySelector('.lesson-title').innerText = data.lesson.lesson_name;
        document.querySelector('.lesson-price').innerText = data.lesson.lesson_price;
        document.querySelector('.lesson-level').innerText = data.lesson.lesson_level;
        document.querySelector('.lesson-date').innerText = moment(data.lesson.start).format('LLLL');
        document.querySelector('.lesson-language').innerText = data.lesson.lesson_language;
        document.querySelector('.lesson-duration').innerText = data.lesson.lesson_duration;
        document.querySelector('.lesson-description').innerText = data.lesson.lesson_description;
        document.querySelector('.lesson-material').innerText = data.lesson.lesson_material_needed;
      });
  }
}
