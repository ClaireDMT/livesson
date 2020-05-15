  // TOGGLE LESSON SECTION ON SHOW PROF
const toggleLesson = () => {
  const showLesson = document.getElementById("show-lesson");
  const closingCross = document.getElementById("closing-cross");
  if(document.body.contains(closingCross)) {
    closingCross.addEventListener("click", (event) => {
      const showLessonContainer = document.getElementById("show-lesson-container");
      showLessonContainer.style.display = "none";
    })
  }
}

export { toggleLesson };
