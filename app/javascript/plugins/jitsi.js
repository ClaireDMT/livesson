const createLessonStream = () => {
  const domain = 'localhost:3000';
  const lessonContainer = document.querySelector('#lesson-video-container');
  const lessonId = lessonContainer.dataset.lessonId;
  const options = {
      roomName: `lessons/${lessonId}`,
      width: '100%',
      height: '100%',
      parentNode: document.querySelector('#lesson-video-container')
  };
  const api = new JitsiMeetExternalAPI(domain, options);
}

export { createLessonStream };
