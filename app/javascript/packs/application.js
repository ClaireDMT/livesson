require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

import { initCalendar } from '../plugins/fullcalendar';
  initCalendar();

import "controllers"

import { toggleLesson } from '../plugins/toggle_lesson';
toggleLesson();
