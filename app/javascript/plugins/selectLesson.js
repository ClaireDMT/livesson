// click on a event in the calendar, update the show of the lesson
const selectLesson = (id) => {
  const showLesson = document.getElementById('show-lesson');
  console.log(id);
  showLesson.innerHTML = '<%= j render "lessons/show", lesson: Lesson.where(id: id), prof: Lesson.where(id: id).prof %>';
}

export { selectLesson };
