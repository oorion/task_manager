// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  $('.complete').on('click', function() {
    $.post("/api/tasks/" + $(this).parent()[0].id, {}, function(data) {});
  });

  $('.incomplete').on('click', function() {
    $.post("/api/tasks/" + $(this).parent()[0].id, {}, function(data) {});
  });

  $('.sort-by-title').on('click', function() {
    var $sortedTasks = $('.list-tasks').children().sort(function(x, y) {
      return $(x).find('.title').html() > $(y).find('.title').html();
    });
    $('.list-tasks').html($sortedTasks);
  });

  $('.sort-by-due-date').on('click', function() {
    var $sortedTasks = $('.list-tasks').children().sort(function(x, y) {
      return $(x).find('.due-date').html() < $(y).find('.due-date').html();
    });
    $('.list-tasks').html($sortedTasks);
  });

  function fuzzyMatch(element, searchTerm) {
    var output = false;
    $(element).children().each(function (i, e, a) {
      if ($(e).html().match(searchTerm)) {
        output = true;
      }
    });
    return output;
  }

  $('.search').on('keyup', function() {
    var searchTerm = new RegExp($(".search").val(), "i");
    $('.list-tasks').children().each(function(index, element) {
      if (fuzzyMatch(element, searchTerm)) {
        $(element).show();
      } else {
        $(element).hide();
      }
    });
  });
});
