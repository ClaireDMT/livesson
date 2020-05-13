require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "controllers"
import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';
import '../plugins/toggle_dropdown_button';
import '../plugins/persist_checkboxes_after_reload';

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
import { openFormTemplate } from '../plugins/template_lesson_pop_up_creation.js';
openFormTemplate();
import { closeFormTemplate } from '../plugins/template_lesson_pop_up_creation.js';
closeFormTemplate();
import { openFormLesson } from '../plugins/template_lesson_pop_up_creation.js';
openFormLesson();
import { closeFormLesson } from '../plugins/template_lesson_pop_up_creation.js';
closeFormLesson();
