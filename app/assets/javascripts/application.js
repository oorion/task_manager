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
  $('.update-task').on('click', function() {
    var taskId = this.parentNode.parentNode.id;
    $.getJSON('/api/tasks/' + taskId + '.json', function(task) {
      console.log(task);
    });
  });

  $('.sort-by-title').on('click', function() {
    $('.sort-by-title').remove();
    $.getJSON('/api/tasks.json', function(tasks) {
      console.log(tasks);
    });
  });

  $('.search').on('keyup', function() {
    var $tasks = $('.task');
    $tasks.each(function(i, e, a) {
      if ($(e).children().includes($('.search').val())) {
        e.hide()
      }
    });
  });
});
