$(document).ready(function () {
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
