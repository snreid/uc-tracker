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
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap/modal
//= require_tree .
$(document).ready(function(){
  $('#my_foods').dataTable({
    "aoColumns": [
          { "bSortable": true },
          { "bSortable": false },
          { "bSortable": false },
          { "bSortable": false }
        ]
  });






  $('.add-food-form').submit(function() {  
    capture_submit_to_ajax("Food successfully added!")
    return false; // prevents normal behaviour
  });
  $('.trackable-modal-form').submit(function() {  
    capture_submit_to_ajax("Thank you for tracking!")
    return false; // prevents normal behaviour
  });

});

function capture_submit_to_ajax(success_message){
  var valuesToSubmit = $(this).serialize();
  $.ajax({
      type: "POST",
      url: $(this).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
  }).success(function(json){
      alert(success_message);
  });
}

