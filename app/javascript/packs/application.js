//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require turbolinks
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

<<<<<<< HEAD
import { toggleDisplay } from '../plugins/toggle_display';
toggleDisplay();

$('#calendar').fullCalendar({});
=======
>>>>>>> master
