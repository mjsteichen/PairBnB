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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  var available = "add";
  var residence = 0;

  $(".displays").hide();
  $("#user_availabilities").show();
  $("#mess").click(function(event) {
    event.preventDefault();
    $(".displays").hide();
    $("#user_messages").show()
  });
  $("#res").click(function(event) {
    event.preventDefault();
    $(".displays").hide();
    $("#user_residences").show()
  });
  $("#avail").click(function(event) {
    event.preventDefault();
    $(".displays").hide();
    $("#user_availabilities").show()
  });
  $("#info").click(function(event) {
    event.preventDefault();
    $(".displays").hide();
    $("#user_information").show()
  });

  $("#add").click(function(event) {
    event.preventDefault();
    available = "add"
  });

  $("#remove").click(function(event) {
    event.preventDefault();
    available = "remove"
  });

  $(".residence").click(function(event) {
    event.preventDefault();
    residence = $(this).attr("id") - 1
  })

  YUI().use('calendar', 'datatype-date', 'cssbutton',  function(Y) {

    // Create a new instance of calendar, placing it in
    // #mycalendar container, setting its width to 340px,
    // the flags for showing previous and next month's
    // dates in available empty cells to true, and setting
    // the date to today's date.
    var calendar = new Y.Calendar({
      contentBox: "#mycalendar",
      width:'340px',
      showPrevMonth: false,
      showNextMonth: false,
      date: new Date()}).render();

    // Get a reference to Y.DataType.Date
    var dtdate = Y.DataType.Date;

    // Listen to calendar's selectionChange event.
    calendar.on("selectionChange", function (ev) {
      ev.preventDefault();

      var newDate = ev.newSelection[0];
      var date = dtdate.format(newDate);
      if (date.slice(8, 9) === '0') {
        var day = date.slice(9, 10);
      } else {
        var day = date.slice(8, 10);
      };
      if (available == "add") {
        $("td").filter(function( index ) { return $(this).text() === day; }).css("background-color", "#14A714");
        $.ajax({
          url: "/users/" + $("a:contains('Logout')").attr("href").slice(-1) + "/availabilities",
          type: "POST",
          data: { date: date, residence: residence}
        });
      } else {
        $("td").filter(function( index ) { return $(this).text() === day; }).css("background-color", "white");
        $.ajax({
          url: "/users/" + $("a:contains('Logout')").attr("href").slice(-1) + "/availabilities/",
          type: "POST",
          data: { date: date, residence: residence}
        });
      }
      Y.one("#selecteddate").setHTML(dtdate.format(newDate));
    });
  });
});
