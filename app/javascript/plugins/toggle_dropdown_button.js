// Variables I will be listening to and amending
const dropdownButton = document.getElementById('dropdown-toggle');
const dropdownMenu = document.getElementById('dropdown-menu');

// Listen to the click on the button to open and close the dropdown
dropdownButton.addEventListener('click', (e) => {
  dropdownMenu.classList.toggle("show");
});
