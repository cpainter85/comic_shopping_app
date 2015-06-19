$(document).ready(function () {

  $('.publisher-list').hide();

  $(document).on('click', '.publisher-toggle', function (event) {
    event.preventDefault();
    if ($('.publisher-list').is(':visible')) {
      $('.publisher-list').slideUp();
    }
    else {
      $('.publisher-list').slideDown();
    }
  });

});
