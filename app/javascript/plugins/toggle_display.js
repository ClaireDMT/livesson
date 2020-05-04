const upcoming_lessons = document.getElementById("toggleUpcomingLessons");
const buttonUpcoming = document.getElementById("buttonToggleUpcoming");

buttonUpcoming.addEventListener("click", (event) => {
  if(upcoming_lessons.style.display === "block"){
    upcoming_lessons.style.display = "none"
  }
  else {
    upcoming_lessons.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})

const past_lessons = document.getElementById("togglePastLessons");
const buttonPast = document.getElementById("buttonTogglePast");

buttonPast.addEventListener("click", (event) => {
  if(past_lessons.style.display === "block"){
    past_lessons.style.display = "none"
  }
  else {
    past_lessons.style.display = "block"
  }
  event.style.tranform == "rotate(-45deg)"
})
