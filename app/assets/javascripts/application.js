// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
/* modernizr-1.7.custom*/
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var fn = function(){
  var footerPos = $("#page_footer").position().top;
  var headerPos = $("#page_header").position().top;
  $("#sidebar").css("height",footerPos-120-headerPos);
  $(".formtag").validate();
};
$(document).on('page:load', fn);
$(document).ready(fn);

