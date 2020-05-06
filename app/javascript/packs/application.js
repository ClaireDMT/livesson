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
  const calendarEl = document.getElementById('calendar');
  // const lessons = JSON.parse(calendarEl.dataset.lessons);
  // console.log(lessons);
  // const newLessons = lessons.map(lesson => new Object({id: lesson.id, start: lesson.beginning_time, end: lesson.end_time}));
  // console.log(newLessons);
  const lessonShow = document.getElementById('lesson-show');

  const lesson = lessonShow.dataset.lessonId;
  // console.log(lesson);


  const calendar = new Calendar(calendarEl, {
    plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin, bootstrapPlugin, momentPlugin, momentTimezonePlugin  ],
    // titleFormat: 'MMMM D, YYYY',
    //
    timeZone: 'local',
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
    events: `/lessons/${lesson}.json`,
    displayEventTime: true,
    displayEventEnd: true
  });

  calendar.render();
});
