
  // TOGGLE POUR LES RESERVATIONS PROF A VENIR
  const upcoming_lessons = document.getElementById("toggleUpcomingLessons");
  const buttonUpcoming = document.getElementById("buttonToggleUpcomingLessons");

if(document.body.contains(upcoming_lessons)) {
  buttonUpcoming.addEventListener("click", (event) => {
    if(upcoming_lessons.style.display === "block"){
      upcoming_lessons.style.display = "none"
    }
    else {
      upcoming_lessons.style.display = "block"
    }
    event.target.nextElementSibling.style.tranform = "rotate(45deg)";
  })
}

  // TOGGLE POUR LES RESERVATIONS PROF PASSEES
  const past_lessons = document.getElementById("togglePastLessons");
  const buttonPast = document.getElementById("buttonTogglePastLessons");

if(document.body.contains(past_lessons)) {
  buttonPast.addEventListener("click", (event) => {
    if(past_lessons.style.display === "block"){
      past_lessons.style.display = "none"
    }
    else {
      past_lessons.style.display = "block"
    }
    event.target.nextElementSibling.style.tranform = "rotate(45deg)";
  })
}

// TOGGLE POUR LES RESERVATIONS PROF ANNULES
  const cancelled_lessons = document.getElementById("toggleCancelledLessons");
  const buttonCancelled = document.getElementById("buttonToggleCancelledLessons");

if(document.body.contains(cancelled_lessons)) {
  buttonCancelled.addEventListener("click", (event) => {
    if(cancelled_lessons.style.display === "block"){
      cancelled_lessons.style.display = "none"
    }
    else {
      cancelled_lessons.style.display = "block"
    }
    event.target.nextElementSibling.style.tranform = "rotate(45deg)";
  })
}
