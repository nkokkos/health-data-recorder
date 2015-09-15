#jQuery(function() {
#  return $('#events-raw-data').dataTable({
#    asSorting: [['0', 'desc']],
#    aaSorting: [['0', 'desc']],
#    sPaginationType: "full_numbers"
#  });
#});
# // generated by coffee-script 1.9.2
# coffee script follows:
# see this for resizing-> http://stackoverflow.com/questions/11269146/how-to-automatically-adjust-a-datatable-based-on-the-browsers-zoom

jQuery ->
  $('#events-raw-data').dataTable
    asSorting: [['0','desc']]
    aaSorting: [['0','desc']]
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    bInfo: true
    bAutoWidth: false
    responsive: true
    sAjaxSource: $('#events-raw-data').data('source')
