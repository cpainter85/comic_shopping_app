$(document).ready(function () {

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

  $(document).on('click', '.vol-alpha-letter', function (e) {
    $('.ind-volume').hide();

    if ($(this).hasClass('label-primary') || $(this).hasClass('vol-show-all')) {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $('.vol-show-all').removeClass('label-default').addClass('label-primary');
      $('.ind-volume').fadeIn();
    }
    else {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $(this).removeClass('label-default').addClass('label-primary');
      var filterLetter = $(this).text().trim();
      $('.ind-volume').filter(function () {
        return filterLetter === $(this).children().last().text()[0];
      }).fadeIn();
    }
  });

  $(document).on('click', '.alpha-letter', function (e) {
    $('.ind-character').hide();

    if ($(this).hasClass('label-primary') || $(this).hasClass('show-all')) {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $('.show-all').removeClass('label-default').addClass('label-primary');
      $('.ind-character').fadeIn();
    }
    else {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $(this).removeClass('label-default').addClass('label-primary');
      var filterLetter = $(this).text().trim();
      $('.ind-character').filter(function () {
        return filterLetter === $(this).children().last().text()[0];
      }).fadeIn();
    }
  });
});
