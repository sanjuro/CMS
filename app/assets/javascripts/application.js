// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require_self
//= require jquery-1.7.1.min
//= require jquery_ujs
//= require highcharts
$(function() {
  $("#clients_search input").keyup(function() {
    $.get($("#clients_search").attr("action"), $("#clients_search").serialize(), null, "script");
    return false;
  });
});