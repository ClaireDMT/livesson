function openFormTemplate() {
  document.getElementById("lesson-new").style.display = "none"
  document.getElementById("template-new").style.display = "block";
}
function closeFormTemplate() {
  document.getElementById("template-new").style.display = "none";
}
function openFormLesson() {
  document.getElementById("template-new").style.display = "none";
  document.getElementById("lesson-new").style.display = "block";
}
function closeFormLesson() {
  document.getElementById("lesson-new").style.display = "none";
}
export { openFormTemplate };
export { closeFormTemplate };
export { openFormLesson };
export { closeFormLesson };
