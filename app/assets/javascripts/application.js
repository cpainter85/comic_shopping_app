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
//= require jquery-ui
//= require jquery.turbolinks


$(document).ready(function () {

  // Go to next issue
  if ($('.next-issue').length === 1) {
    $(document).keydown(function (key) {
      if (key.which === 39) {
        window.location.href = $('.next-issue').attr('href');
      }
      else {
        return true;
      }
      key.preventDefault();
    })
  }

  // Go to previous issue
  if ($('.previous-issue').length === 1) {
    $(document).keydown(function (key) {
      if (key.which === 37) {
        window.location.href = $('.previous-issue').attr('href');
      }
      else {
        return true;
      }
      key.preventDefault();
    })
  }

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
    }, 600);
    $('.expand').hide();
    $('.retract').show();

  });

  $(document).on('click', '.retract', function () {
    $('.full-description').animate({
      height: 250
    }, 600);
    $('.retract').hide();
    $('.expand').show();
  });

  $('.pub-characters').hide();

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

  // for faq page
  $(function() {
    $( "#accordion" ).accordion({
      collapsible: true,
      active: false
    });
  });

  // leaving for vendor
  $(document).on('click', '.vendor', function (event) {
    event.preventDefault();
    $('.container').append('<div class="dialog"><p class="dialog-message"></p></div>')
    var vendorUrl = $(this).attr('href');
    var vendorName = $(this).attr('data-vendor');
    $(function() {
      $( ".dialog" ).dialog();
    });
    $('.dialog-message').text('You are now leaving DigitalComicShopper.ninja for ' + vendorName)
    setTimeout(function () {
      window.location.href = vendorUrl;
    }, 1500);
  })

});
