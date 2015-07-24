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
//= require highcharts
//= require highcharts/highcharts-more
//= require highcharts/adapters/mootools-adapter
//= require highcharts/adapters/prototype-adapter
//= require highcharts/adapters/standalone-framework
//= require highcharts/modules/annotations
//= require highcharts/modules/canvas-tools
//= require highcharts/modules/data
//= require highcharts/modules/drilldown
//= require highcharts/modules/exporting
//= require highcharts/modules/funnel
//= require highcharts/modules/heatmap
//= require highcharts/modules/no-data-to-display
//= require highcharts/themes/skies
//= require bootstrap-sprockets
//= require bootstrap/modal
//= require_tree .


$(document).ready(function(){

  $('#my_foods').dataTable({
    "aoColumns": [
          { "bSortable": true },
          { "bSortable": false },
          { "bSortable": false },
          { "bSortable": false },
          { "bSortable": false }
        ]
  });





  $('.add-food-form').submit(function() { 
    capture_submit_to_ajax(this, "Food successfully added!")
    return false; // prevents normal behaviour
  });
  

  $('#chart-container').highcharts({
        title: {
            text: 'Monthly Average Temperature',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'New York',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: 'Berlin',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });


});


function capture_submit_to_ajax(obj, success_message){

  var valuesToSubmit = $(obj).serialize();
  $.ajax({
      type: "POST",
      url: $(obj).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
  }).success(function(json){
      alert(success_message);
  });
}

