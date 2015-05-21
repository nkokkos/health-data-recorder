# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  Morris.Line
    element: 'device-area-chart'
    data: $('#device-area-chart').data('chartdata')
    xkey: 'created_at'
    ykeys: ['data']
    labels: ['data']
    pointSize: 4
    hideHover: 'auto'
    resize: true
    pointFillColors: ['#ffffff']
    pointStrokeColors: ['green']

$ ->
  $('#device-raw-data').dataTable()
  "scrollX": false
  "scrollY": false
