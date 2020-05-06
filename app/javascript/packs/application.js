require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

