import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
                           dateFormat: "d-m-Y",
                           "locale": French
                         })

flatpickr("#query_lesson_date", {
                                  "locale": French
                                })

flatpickr("#query_beginning_time", {
                                  enableTime: true,
                                  noCalendar: true,
                                  dateFormat: "H:i",
                                  time_24hr: true
                                })
