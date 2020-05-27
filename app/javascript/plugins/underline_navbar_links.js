const underlineNavbarLinks = () => {
  const cours = document.getElementById("cours");
  const planning = document.getElementById("planning");
  const reservations = document.getElementById("reservations");
  const aide = document.getElementById("aide");

  if(window.location.pathname.split('/')[3] === "mon-planning") {
    planning.style.borderBottom = "2px solid #7921E9";
  }
  else if(window.location.pathname.split('/')[3] === "mes-cours") {
    cours.style.borderBottom = "2px solid #7921E9";
  }
  else if(window.location.pathname.split('/')[3] === "mes-reservations") {
    reservations.style.borderBottom = "2px solid #7921E9";
  }
}

export { underlineNavbarLinks };
