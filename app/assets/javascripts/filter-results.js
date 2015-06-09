$(document).ready(function () {
  // $('.filter-none').hide();

  $(document).on('click', '.filter', function () {
    $('.results').hide()

    if($(this).hasClass('btn-primary') || $(this).hasClass('filter-none')) {
      $('.btn-primary').removeClass('btn-primary').addClass('btn-default')
      $('.filter-none').removeClass('btn-default').addClass('btn-primary')
      $('.results').fadeIn();

    }

    else {
      $('.btn-primary').removeClass('btn-primary').addClass('btn-default')
      $(this).removeClass('btn-default').addClass('btn-primary')

      if ($(this).hasClass('filter-volumes')) {
        $('.results-volumes').fadeIn();
      }
      else if ($(this).hasClass('filter-creators')) {
        $('.results-creators').fadeIn();
      }
      else {
        $('.results-characters').fadeIn();
      }
    }
  });
});
