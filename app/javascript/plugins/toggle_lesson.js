  // TOGGLE LESSON SECTION ON SHOW PROF
const toggleLesson = () => {

  const showLesson = document.querySelector("#prof-show #show-lesson");
  const closingCross = document.getElementById("closing-cross");
  if(document.body.contains(showLesson)) {
    console.log(showLesson);
    console.log(closingCross);
    closingCross.addEventListener("click", (event) => {
      showLesson.style.display = "none";
    })
  }
}

export { toggleLesson };
