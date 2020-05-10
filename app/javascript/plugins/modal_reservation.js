import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const modalReservations = () => {
  $('#reservationsModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('lesson') // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    modal.find('.modal-body p').text(recipient)
  })
};

export { modalReservations };
