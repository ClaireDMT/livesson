import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import $ from 'jquery';
let today = new Date()
let year = today.getFullYear()
let month = today.getMonth()
let day = today.getDate()
const birthDate = new Date(year - 12, month, day)
const submitButton = document.getElementById('submit-form')

flatpickr(".datepicker", {
                          dateFormat: "d-m-Y",
                          "locale": French,
                          minDate: "today"
                         })

flatpickr(".date-birthdate", {
                                    dateFormat: "d-m-Y",
                                    "locale": French,
                                    maxDate: "31-12-2008",
                                    minDate: "01-01-1900"
                                  })

const flatpickr_lesson_date = flatpickr("#query_lesson_date", {
                                  "locale": French,
                                  minDate: "today",
                                  onChange: function(selectedDates, dateStr, instance) {
                                    submitButton.click()
                                  }
                                })


$(".clear_flatpickr_lesson_date").click(function() {
   flatpickr_lesson_date.clear();
})


const flatpickr_start = flatpickr("#query_start", {
                            enableTime: true,
                            noCalendar: true,
                            dateFormat: "H:i",
                            time_24hr: true,
                            defaultHour: 12,
                            defaultMinute: 0,
                          })

$(".clear_flatpickr_lesson_start").click(function() {
   flatpickr_start.clear();
})


flatpickr("#query_end", {
                            enableTime: true,
                            noCalendar: true,
                            dateFormat: "H:i",
                            time_24hr: true,
                            defaultHour: 12,
                            defaultMinute: 0,
                          })
