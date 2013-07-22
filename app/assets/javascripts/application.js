// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require timesheets
//= require_tree .


$(".nicetable").tablecloth({
  theme: "default",
  bordered: true,
  condensed: true,
  striped: true,
  sortable: true,
  clean: true,
  cleanElements: "th td",
  customClass: "myTable"
});

$("table").tablesorter( {sortList: [[0,0], [1,0]]} );





$(".datepicker").datepicker({
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  });
