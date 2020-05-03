import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
                           dateFormat: "d-m-Y",
                           "locale": French
                         })