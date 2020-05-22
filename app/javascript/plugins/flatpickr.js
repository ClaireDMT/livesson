import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
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

flatpickr(".datepicker-birthdate", {
                                    dateFormat: "d-m-Y",
                                    "locale": French,
                                    maxDate: "1 janvier 2009",
                                    minDate: "1 janvier 1900"
                                  })

flatpickr("#query_lesson_date", {
                                  "locale": French,
                                  minDate: "today",
                                  onChange: function(selectedDates, dateStr, instance) {
                                    submitButton.click()
                                  }
                                })

flatpickr("#query_start", {
                            enableTime: true,
                            noCalendar: true,
                            dateFormat: "H",
                            time_24hr: true,
                            defaultHour: 12,
                            defaultMinute: 0,
                            onChange: function(selectedDates, dateStr, instance) {
                              submitButton.click()
                            }
                          })
