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
});
