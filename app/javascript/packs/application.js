require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';
import '../plugins/toggle_dropdown_button';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();
