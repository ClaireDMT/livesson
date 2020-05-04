// TOGGLE POUR LES RESERVATIONS PROF A VENIR
const upcoming_lessons = document.getElementById("toggleUpcomingLessons");
const buttonUpcoming = document.getElementById("buttonToggleUpcomingLessons");

buttonUpcoming.addEventListener("click", (event) => {
  if(upcoming_lessons.style.display === "block"){
    upcoming_lessons.style.display = "none"
  }
  else {
    upcoming_lessons.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})

// TOGGLE POUR LES RESERVATIONS PROF PASSEES
const past_lessons = document.getElementById("togglePastLessons");
const buttonPast = document.getElementById("buttonTogglePastLessons");

buttonPast.addEventListener("click", (event) => {
  if(past_lessons.style.display === "block"){
    past_lessons.style.display = "none"
  }
  else {
    past_lessons.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})

// TOGGLE POUR LES RESERVATIONS ELEVE A VENIR
const upcoming_bookings = document.getElementById("toggleUpcomingBookings");
const buttonUpcomingBooking = document.getElementById("buttonToggleUpcomingBookings");

buttonUpcomingBooking.addEventListener("click", (event) => {
  if(upcoming_booking.style.display === "block"){
    upcoming_booking.style.display = "none"
  }
  else {
    upcoming_booking.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})

// TOGGLE POUR LES RESERVATIONS ELEVE PASSEES
const past_bookings = document.getElementById("togglePastBookings");
const buttonPastBooking = document.getElementById("buttonTogglePastBookings");

buttonPastBooking.addEventListener("click", (event) => {
  if(past_booking.style.display === "block"){
    past_booking.style.display = "none"
  }
  else {
    past_booking.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})
