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
  
$ -> 
  $(".dropdown-menu li a").click ->
    alert(window.location.href)