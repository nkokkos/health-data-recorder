#global general coffeescript file for graph generation
#default graphing value is 6 months
$ ->
  Morris.Line
    element: 'device'
    data: $('#device').data('chartdata')
    xkey: 'created_at'
    ykeys:  ['data1', 'data2']
    labels: ['data1', 'data2']
    pointSize: 5
    hideHover: 'auto'
    resize: true
    #pointFillColors: ['#ffffff']
    #pointStrokeColors: ['red']
