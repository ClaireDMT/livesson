require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "controllers"
import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

import { initCalendar } from '../plugins/fullcalendar';
if (document.body.contains(document.getElementById('prof-show'))) {
  initCalendar();
}

import { toggleLesson } from '../plugins/toggle_lesson';
toggleLesson();

import { createLessonStream } from '../plugins/jitsi.js';
createLessonStream();

import { modalReservations } from '../plugins/modal_reservation.js';
modalReservations();
