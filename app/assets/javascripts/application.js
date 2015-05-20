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


  if ($('.description').text().length > 1000) {
    $('.full-description').append('<span class="retract glyphicon glyphicon-minus"></span>')
    $('.full-description').hide();
    $('.description').append('<div class="small-text">' + $('.full-description').html().substring(0,1000)+'... ' + '<span class="expand glyphicon glyphicon-plus"></span>')
  }
  $(document).on('click', '.expand', function () {
    $('.full-description').show();
    $('.small-text').hide();
  });


  $(document).on('click', '.glyphicon-minus', function () {
    $('.full-description').hide();
    $('.small-text').show();
  });
});
