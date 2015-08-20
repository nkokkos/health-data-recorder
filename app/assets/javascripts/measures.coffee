#global ganeral coffeescript file for graph generation
#default graphing value is 6 months
$ ->
  this_graph = Morris.Line
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

  $(".dropdown-menu li a").click ->
    if (this.id) == 'sevendays'
      $.ajax
        url:  window.location.href+'/sevendays'
        data: format: 'json'
        datatype: 'json'
        cache: false
        type: 'GET'
        success: (response) ->
          #json_obj = $.parseJSON(response)<- this does not work
          #console.log(response)
          this_graph.setData(response)
    else if (this.id) == 'thirtydays'
      $.ajax
        url:  window.location.href+'/thirtydays'
        data: format: 'json'
        datatype: 'json'
        cache: false
        type: 'GET'
        success: (response) ->
          #console.log(response)
          this_graph.setData(response)
    else if (this.id) == 'sixmonths'
      $.ajax
        url:  window.location.href+'/sixmonths'
        data: format: 'json'
        datatype: 'json'
        cache: false
        type: 'GET'
        success: (response) ->
          #console.log(response)
          this_graph.setData(response)
    else if (this.id) == 'c_year'
      $.ajax
        url:  window.location.href+'/c_year'
        data: format: 'json'
        datatype: 'json'
        cache: false
        type: 'GET'
        success: (response) ->
          #console.log(response)
          this_graph.setData(response)
    else if (this.id) == 'l_year'
      $.ajax
        url:  window.location.href+'/l_year'
        data: format: 'json'
        datatype: 'json'
        cache: false
        type: 'GET'
        success: (response) ->
          #console.log(response)
          this_graph.setData(response)
