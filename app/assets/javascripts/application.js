// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require jquery.turbolinks

$(document).ready(function () {

  // Go to next issue
  if ($('.glyphicon-chevron-right').length === 1) {
    $('body').keydown(function (key) {
      if (key.which === 39) {
        window.location.href = $('.glyphicon-chevron-right').attr('href');
      }
      else {
        return true;
      }
      key.preventDefault();
    })
  }

  // Go to previous issue
  if ($('.glyphicon-chevron-left').length === 1) {
    $('body').keydown(function (key) {
      if (key.which === 37) {
        window.location.href = $('.glyphicon-chevron-left').attr('href');
      }
      else {
        return true;
      }
      key.preventDefault();
    })
  }

  //hide and expand descriptions
  if ($('.full-description').prop('scrollHeight') > $('.full-description').height()) {
    $('.expansion-button').append('<span class="expand glyphicon glyphicon-collapse-down"></span>')
  }
  else {
    $('.full-description').removeClass('full-description').addClass('short-description');
  }

  $(document).on('click', '.expand', function () {
    if($('.retract').length === 0) {
      $('.expansion-button').append('<span class="retract glyphicon glyphicon-collapse-up"></span>');
    }

    var descriptionHeight = $('.full-description').prop('scrollHeight');
    $('.full-description').animate({
      height: descriptionHeight
    }, 800);
    $('.expand').hide();
    $('.retract').show();

  });

  $(document).on('click', '.retract', function () {
    $('.full-description').animate({
      height: 250
    }, 800);
    $('.retract').hide();
    $('.expand').show();
  });

  //hide and expand character appearances
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

  $('.pub-characters').hide();
  $('.btn-volumes').hide();

  // $(document).on('click', '.btn-pub-toggle', function () {
  //   console.log('toggle!');
  //   $('.pub-volumes').toggle();
  //   $('.pub-characters').toggle();
  //   $('.btn-characters').toggle();
  //   $('.btn-volumes').toggle();
  // });

  $(document).on('click', '.btn-characters', function () {
    $('.pub-characters').fadeIn('slow');
    $('.pub-volumes').hide();
    $('.btn-characters').hide();
    $('.btn-volumes').show();
  });

  $(document).on('click', '.btn-volumes', function () {
    $('.pub-characters').hide();
    $('.pub-volumes').fadeIn('slow');
    $('.btn-characters').show();
    $('.btn-volumes').hide();
  });

  $('.filter-none').hide();

  $(document).on('click', '.filter-volumes', function () {
    $('.result-header').text('Search Results (Volumes)');

    $('.filter-volumes').hide();
    $('.filter-creators').show();
    $('.filter-characters').show();
    $('.filter-none').show();

    $('.results-volumes').hide();
    $('.results-creators').hide();
    $('.results-characters').hide();

    $('.results-volumes').fadeIn('slow');
  });

  $(document).on('click', '.filter-creators', function () {
    $('.result-header').text('Search Results (Creators)')

    $('.filter-volumes').show();
    $('.filter-creators').hide();
    $('.filter-characters').show();
    $('.filter-none').show();

    $('.results-volumes').hide();
    $('.results-creators').hide();
    $('.results-characters').hide();

    $('.results-creators').fadeIn('slow');

  });

  $(document).on('click', '.filter-characters', function () {
    $('.result-header').text('Search Results (Characters)')

    $('.filter-volumes').show();
    $('.filter-creators').show();
    $('.filter-characters').hide();
    $('.filter-none').show();

    $('.results-volumes').hide();
    $('.results-creators').hide();
    $('.results-characters').hide();

    $('.results-characters').fadeIn('slow');

  });

  $(document).on('click', '.filter-none', function () {
    $('.result-header').text('Search Results (All)')

    $('.filter-volumes').show();
    $('.filter-creators').show();
    $('.filter-characters').show();
    $('.filter-none').hide();

    $('.results-volumes').hide();
    $('.results-creators').hide();
    $('.results-characters').hide();

    $('.results-volumes').fadeIn('slow');
    $('.results-creators').fadeIn('slow');
    $('.results-characters').fadeIn('slow');
  });

  $(document).on('click', '.alpha-letter', function (e) {
    $('.ind-character').hide();
    console.log($(this).hasClass('label-primary'));
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
