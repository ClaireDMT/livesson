//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require turbolinks
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

import { toggleDisplay } from '../plugins/toggle_display';
toggleDisplay();

$('#calendar').fullCalendar({});
