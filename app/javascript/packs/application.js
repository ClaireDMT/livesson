//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require turbolinks
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();
<<<<<<< HEAD

<<<<<<< HEAD
import { toggleDisplay } from '../plugins/toggle_display';
toggleDisplay();

$('#calendar').fullCalendar({});
=======
>>>>>>> master
=======
>>>>>>> master
