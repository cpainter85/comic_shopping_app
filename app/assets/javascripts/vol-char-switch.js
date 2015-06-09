$(document).ready(function () {

  $('.pub-characters').hide();

  $(document).on('click', '.btn-pub-toggle', function (e) {
    if (!($(this).hasClass('btn-primary'))) {
      $('.btn-primary').removeClass('btn-primary').addClass('btn-default');
      $(this).removeClass('btn-default').addClass('btn-primary');
      $('.pub').hide();
      if ($(this).hasClass('btn-characters')) {
        $('.pub-characters').fadeIn();
      }
      else {
        $('.pub-volumes').fadeIn();
      }
    }
  });
});
