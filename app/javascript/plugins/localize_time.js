const moment = require('moment-timezone');
const userZone = moment.tz.guess();
moment.locale('fr');

const localTime = () => {
  const lessonTimes = document.querySelectorAll(".local-time");// create a function to automatically update the hour_of_event in local time
  lessonTimes.forEach((lessonTime) => {
    lessonTime.textContent = moment.tz(lessonTime.innerHTML.slice(0,-4), 'UTC').clone().tz(userZone).format(`dddd Do MMM à H[h]mm `);
  })
}// call the function

export { localTime };
