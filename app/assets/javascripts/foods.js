// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){


  $('.add-food-form').submit(function() {  
    console.log("You are submitting a food")
      var valuesToSubmit = $(this).serialize();
      $.ajax({
          type: "POST",
          url: $(this).attr('action'), //sumbits it to the given url of the form
          data: valuesToSubmit,
          dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
      }).success(function(json){
          alert("Food successfully added!");
      });
      return false; // prevents normal behaviour
  });

})