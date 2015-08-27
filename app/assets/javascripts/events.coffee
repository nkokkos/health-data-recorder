$(document).ready ->
  $('#events-raw-data').dataTable()
  "scrollX": false
  "scrollY": false
  sPaginationType: "full_numbers"
  bJQueryUI: true
  bProcessing: true
  bServerSide: true
