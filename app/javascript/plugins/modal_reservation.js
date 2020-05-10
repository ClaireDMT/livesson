import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const modalReservations = () => {
  $('#reservationsModal').on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget) // Button that triggered the modal
    const lessonId = button.data('reservations') // Extract info from data-* attributes
    const participants = button.data('participants').split(',')
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    const modal = $(this)
    modal.find('.modal-body ul')[0].innerHTML = "";
    participants.forEach(participant => {
      modal.find('.modal-body ul')[0].insertAdjacentHTML('beforeend', `<li>${participant}</li>`);
    });
  })
};

export { modalReservations };
