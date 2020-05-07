// click on a event in the calendar, update the show of the lesson
const getAllLessons = () => {
  const events = document.querySelectorAll('#prof-show #calendar .fc-event');
  console.log(events);
}

export { getAllLessons };
