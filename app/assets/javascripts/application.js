// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap
//= require_tree .

//= require turbolinks
//= require jquery.turbolinks
//= require jquery.easy-autocomplete

(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');
 
    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');
 
    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();


$(document).on('turbolinks:load', function() {
  $('.reply-form').hide();
  $('.reply-button').on('click', function(e){
    e.preventDefault();
    $(this).next('.reply-form').toggle(); // Show form on button click
  });

});


$(document).ready(function(){
  $(".show-replies").click(function(){
    $(this).text($(this).text() == "Hide replies" ? "Show replies" : "Hide replies");
        $(this).next("#comments-ul").toggle();
    });});
