//= require moment
//= require moment

// moment-timezone without timezone data
//= require moment-timezone

// moment-timezone with timezone data from 2010-2020
//= require moment-timezone-with-data-2010-2020

// moment-timezone all timezone data
//= require moment-timezone-with-data
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/toggle_display_lessons';
import '../plugins/toggle_display_bookings';

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

import { Calendar } from '@fullcalendar/core';
import momentPlugin from '@fullcalendar/moment';
import momentTimezonePlugin from '@fullcalendar/moment-timezone';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import bootstrapPlugin from '@fullcalendar/bootstrap';


document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');


  var calendar = new Calendar(calendarEl, {
    plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin, bootstrapPlugin, momentPlugin, momentTimezonePlugin  ],
    // titleFormat: 'MMMM D, YYYY',
    // timeZone: 'Europe/Paris',
    header: {
      left: 'dayGridMonth,timeGridWeek,timeGridDay',
      center: 'title',
      right: 'prevYear,prev,next,nextYear'
    },
    themeSystem: 'bootstrap',
    defaultDate: '2020-05-06',
    defaultView: 'dayGridMonth',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2020-05-06',
      },
      {
        title: 'Long Event',
        start: '2020-05-06',
        end: '2020-05-07'
      },
      {
        title: 'Conference',
        start: '2020-05-08',
        end: '2020-05-10'
      },
      {
        title: 'Lunch',
        start: '2020-05-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2020-05-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2020-05-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2020-05-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2020-05-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2020-05-28'
      }
    ]
  });

  calendar.render();
});
