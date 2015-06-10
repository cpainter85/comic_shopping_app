$(document).ready(function () {

  $(document).on('click', '.creator-alpha-letter', function () {
    $('.creator_index_element').hide();

    if ($(this).hasClass('label-primary') || $(this).hasClass('creator-show-all')) {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $('.creator-show-all').removeClass('label-default').addClass('label-primary');
      $('.creator_index_element').fadeIn();
    }

    else {
      $('.label-primary').removeClass('label-primary').addClass('label-default');
      $(this).removeClass('label-default').addClass('label-primary');
      var filterLetter = $(this).text();
      $('.creator_index_element').filter(function () {
        return filterLetter === $(this).children().last().text()[0];
      }).fadeIn();
    }
  });
});
