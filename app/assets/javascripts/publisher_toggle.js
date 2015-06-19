$(document).ready(function () {

  $(document).on('click', '.publisher-toggle', function (event) {
    event.preventDefault();
    $('.publisher-list').slideToggle();
  });

});
