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


  if ($('.issue-description').html().length > 1000) {
    $('.test').append('<span class="retract glyphicon glyphicon-minus"></span>')
    $('.test').hide();
    $('.issue-description').prepend('<div class="small-text">' + $('.test').html().substring(0,1000)+'... ' + '<span class="expand glyphicon glyphicon-plus"></span>')
    // $('.issue-description').replaceWith($('.issue-description').html().substring(0,1000)+'... ' + '<button class="expand">Expand</button>');
  }
  $(document).on('click', '.expand', function () {
    $('.test').show();
    // $('.test').append('<span class="retract glyphicon glyphicon-minus"></span>')
    $('.small-text').hide();
  });


  $(document).on('click', '.glyphicon-minus', function () {
    $('.test').hide();
    $('.small-text').show();
  });
});
