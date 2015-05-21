# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'morris-area-chart'
    data: $('#morris-area-chart').data('kilograms')
    xkey: 'created_at'
    ykeys: ['kgr']
    labels: ['Kilograms']
    pointSize: 4
    hideHover: 'auto'
    resize: true
    pointFillColors: ['#ffffff']
    pointStrokeColors: ['green']