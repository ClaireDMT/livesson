//= require moment
//= require moment

// moment-timezone without timezone data
//= require moment-timezone

// moment-timezone with timezone data from 2010-2020
//= require moment-timezone-with-data-2010-2020

// moment-timezone all timezone data
//= require moment-timezone-with-data

import { Calendar } from '@fullcalendar/core';
import momentPlugin from '@fullcalendar/moment';
import momentTimezonePlugin from '@fullcalendar/moment-timezone';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import bootstrapPlugin from '@fullcalendar/bootstrap';
import frLocale from '@fullcalendar/core/locales/fr';


const calendarEl = document.getElementById('calendar');
const profShow = document.getElementById('prof-show');
const prof = profShow.dataset.profId;

const initCalendar = () => {
  document.addEventListener('DOMContentLoaded', function() {
    const calendar = new Calendar(calendarEl, {
      plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin, bootstrapPlugin, momentPlugin, momentTimezonePlugin  ],
      // calendar config time & locale
      timeZone: 'local', // display the date which are UTC at the local time of the user computer (if set)
      locale: frLocale,
      //  Headers
      header: {
        left: 'timeGridDay,timeGridWeek,dayGridMonth',
        center: 'title',
        right: 'prev,today,next'
      },
      navLinks: true, // can click day/week names to navigate views
      // defaultDate: Date.now(),
      buttonText: {
        today: "aujourd'hui"
      },
      // Calendar view & grid
      defaultView: 'dayGridMonth',
      fixedWeekCount: false, //  the number of weeks displayed in a month view. If false, the calendar will have either 4, 5, or 6 weeks, depending on the month.
      allDaySlot: false, // Determines if the “all-day” slot is displayed at the top of the calendar.
      minTime: '06:00:00',
      maxTime: '23:59:00',
      firstDay: 1, // first day is Monday
      contentHeight: 'auto',
      navLinks: true, // allow to click on the day in the month view and redirect to the day view
      // Events
      events: `/eleves/${prof}.json`,
      displayEventTime: true,
      displayEventTitle: false,
      eventLimit: true, // allow "more" link when too many events
      // calendar style
      themeSystem: 'bootstrap',
      eventBackgroundColor: '#7921E9',
      eventBorderColor: '#7921E9',
      eventClick: function(info) {
         info.jsEvent.preventDefault();
       },
      eventRender: function(info) {
        info.el.dataset.action = "click->lessons#refresh";
        info.el.dataset.lessonId = info.event.id;
        const fcContent = info.el.firstChild;
        fcContent.querySelector('.fc-title').remove();
        fcContent.insertAdjacentHTML("afterbegin", `<p class='fc-title'>${info.event.title}</p>` );
        fcContent.insertAdjacentHTML("beforeend", `<p class='fc-duration'>${info.event.extendedProps.duration} min</p>` );
        fcContent.insertAdjacentHTML("beforeend", `<p class='fc-duration'>${info.event.extendedProps.niveau}</p>` );
      }
    });

    calendar.render();
  });
}

export { initCalendar };
