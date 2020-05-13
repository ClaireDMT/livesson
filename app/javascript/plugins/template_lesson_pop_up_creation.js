const newTemplate = document.getElementById("template-new");
const newLesson = document.getElementById("lesson-new");

function openFormTemplate() {
  if (newLesson) {
    newLesson.style.display = "none"
    document.getElementById("template-new").style.display = "block";
  }
}
function closeFormTemplate() {
  if (newTemplate) {
    newTemplate.style.display = "none";
  }
}

function openFormLesson() {
  if (newTemplate) {
    document.getElementById("template-new").style.display = "none";
    document.getElementById("lesson-new").style.display = "block";
  }
}

function closeFormLesson() {
  if (newLesson) {
    document.getElementById("lesson-new").style.display = "none";
  }
}
export { openFormTemplate };
export { closeFormTemplate };
export { openFormLesson };
export { closeFormLesson };
