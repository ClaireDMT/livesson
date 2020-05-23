// Variables I will be listening to and amending
const dropdownButtonHome = document.getElementById('dropdown-toggle-home');
const dropdownMenuHome = document.getElementById('dropdown-menu-home');

const dropdownButtonSportName = document.getElementById('dropdown-toggle-sport-name');
const dropdownMenuSportName = document.getElementById('dropdown-menu-sport-name');

const dropdownButtonLessonLanguage = document.getElementById('dropdown-toggle-lesson-language');
const dropdownMenuLessonLanguage = document.getElementById('dropdown-menu-lesson-language');

const dropdownButtonLessonLevel = document.getElementById('dropdown-toggle-lesson-level');
const dropdownMenuLessonLevel = document.getElementById('dropdown-menu-lesson-level');

const dropdownButtonLessonStartEnd = document.getElementById('dropdown-toggle-lesson-start-end');
const dropdownMenuLessonStartEnd = document.getElementById('dropdown-menu-lesson-start-end');

const dropdownButtonLessonDate = document.getElementById('dropdown-toggle-lesson-date');
const dropdownMenuLessonDate = document.getElementById('dropdown-menu-lesson-date');

// Listen to the click on the button to open and close the dropdown
if(window.location.pathname === "/lessons") {
  dropdownButtonSportName.addEventListener('click', (e) => {
    dropdownMenuSportName.classList.toggle("show");
  });

  dropdownButtonLessonLanguage.addEventListener('click', (e) => {
    dropdownMenuLessonLanguage.classList.toggle("show");
  });

  dropdownButtonLessonLevel.addEventListener('click', (e) => {
    dropdownMenuLessonLevel.classList.toggle("show");
  });

  dropdownButtonLessonStartEnd.addEventListener('click', (e) => {
    dropdownMenuLessonStartEnd.classList.toggle("show");
  });

  dropdownButtonLessonDate.addEventListener('click', (e) => {
    dropdownMenuLessonDate.classList.toggle("show");
  });
}
else if(window.location.pathname === "/") {
  dropdownButtonHome.addEventListener('click', (e) => {
  dropdownMenuHome.classList.toggle("show");
});
}
else if (window.location.pathname === "/home") {
  dropdownButtonHome.addEventListener('click', (e) => {
    dropdownMenuHome.classList.toggle("show");
  });
}
