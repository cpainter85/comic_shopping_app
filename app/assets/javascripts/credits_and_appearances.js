$(document).ready(function () {
  if ($('.appearances li').length > 20) {
    $('.appearances li').filter(function (index) {
      return index > 15;
    }).hide();
    $('.appearances-expansion').append('<span class="expand-appearances glyphicon glyphicon-collapse-down"></span>')
  };

  $(document).on('click', '.expand-appearances', function () {
    if($('.retract-appearances').length === 0) {
      $('.appearances-expansion').append('<span class="retract-appearances glyphicon glyphicon-collapse-up"></span>');
    }

    $('.appearances li').filter(function (index) {
      return index > 15;
    }).slideDown('slow', function () {
    });

    $('.expand-appearances').hide();
    $('.retract-appearances').show();

  });

  $(document).on('click', '.retract-appearances', function () {

    $('.appearances li').filter(function (index) {
      return index > 15;
    }).slideUp('slow', function () {
    });

    $('.expand-appearances').show();
    $('.retract-appearances').hide();

  });

  if ($('.credits li').length > 20) {
    $('.credits li').filter(function (index) {
      return index > 15;
    }).hide();
    $('.credits-expansion').append('<span class="expand-credits glyphicon glyphicon-collapse-down"></span>')
  };

  $(document).on('click', '.expand-credits', function () {
    if($('.retract-credits').length === 0) {
      $('.credits-expansion').append('<span class="retract-credits glyphicon glyphicon-collapse-up"></span>');
    }

    $('.credits li').filter(function (index) {
      return index > 15;
    }).slideDown('slow', function () {
    });

    $('.expand-credits').hide();
    $('.retract-credits').show();

  });

  $(document).on('click', '.retract-credits', function () {

    $('.credits li').filter(function (index) {
      return index > 15;
    }).slideUp('slow', function () {
    });

    $('.expand-credits').show();
    $('.retract-credits').hide();

  });
});
