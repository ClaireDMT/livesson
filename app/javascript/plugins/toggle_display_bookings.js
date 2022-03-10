
  // TOGGLE POUR LES RESERVATIONS ELEVE A VENIR
  const upcoming_bookings = document.getElementById("toggleUpcomingBookings");
  const buttonUpcomingBooking = document.getElementById("buttonToggleUpcomingBookings");

if(document.body.contains(upcoming_bookings)) {
  buttonUpcomingBooking.addEventListener("click", (event) => {
    if(upcoming_bookings.style.display === "block"){
      upcoming_bookings.style.display = "none"
    }
    else {
      upcoming_bookings.style.display = "block"
    }
    event.style.tranform == "rotate(-45deg)"
  });
}


  // TOGGLE POUR LES RESERVATIONS ELEVE PASSEES
  const past_bookings = document.getElementById("togglePastBookings");
  const buttonPastBooking = document.getElementById("buttonTogglePastBookings");

if(document.body.contains(past_bookings)) {
  buttonPastBooking.addEventListener("click", (event) => {
    if(past_bookings.style.display === "block"){
      past_bookings.style.display = "none"
    }
    else {
      past_bookings.style.display = "block"
    }
    event.style.tranform == "rotate(-45deg)"
  })
}
