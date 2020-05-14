const buttonOpenTemplate = document.getElementById("button-template")
const buttonCloseTemplate = document.getElementById("close-template")
const buttonOpenLesson = document.getElementById("button-lesson")
const buttonCloseLesson = document.getElementById("close-lesson")

const openFormTemplate = () => {
  if (document.body.contains(buttonOpenTemplate)) {
    buttonOpenTemplate.addEventListener("click", (event) => {
      document.getElementById("lesson-new").style.display = "none"
      document.getElementById("template-new").style.display = "block";
    })
  }
}
const closeFormTemplate = () => {
  if (document.body.contains(buttonCloseTemplate)) {
    buttonCloseTemplate.addEventListener("click", (event) => {
      document.getElementById("template-new").style.display = "none";
    })
  }
}
function openFormLesson() {
  if (document.body.contains(buttonOpenLesson)) {
    buttonOpenLesson.addEventListener("click", (event) => {
      document.getElementById("template-new").style.display = "none";
      document.getElementById("lesson-new").style.display = "block";
    })
  }
}
function closeFormLesson() {
  if (document.body.contains(buttonCloseLesson)) {
    buttonCloseLesson.addEventListener("click", (event) => {
      document.getElementById("lesson-new").style.display = "none";
    })
  }
}
export { openFormTemplate };
export { closeFormTemplate };
export { openFormLesson };
export { closeFormLesson };

