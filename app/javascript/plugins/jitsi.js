const createLessonStream = () => {
  const lessonContainer = document.querySelector('#lesson-video-container');
  if(document.body.contains(lessonContainer)) {
    const domain = 'meet.jit.si';
    const lessonId = lessonContainer.dataset.lessonId;
    const lessonProfName = lessonContainer.dataset.lessonProfName;
    const lessonProfSurname = lessonContainer.dataset.lessonProfSurname;
    const user = lessonContainer.dataset.user;
    const lessonTitle = lessonContainer.dataset.lessonTitle
    const options = {
        roomName: `lessons/${lessonId}-${lessonProfName}-${lessonProfSurname}`,
        width: '100%',
        height: '100%',
        userInfo: `${user}`,
        parentNode: document.querySelector('#lesson-video-container')
    };
    const api = new JitsiMeetExternalAPI(domain, options);
    api.executeCommand('subject', `${lessonTitle}`);
    api.executeCommand('displayName', `${user}`);
  }
}

export { createLessonStream };
