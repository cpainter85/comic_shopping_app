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
});
