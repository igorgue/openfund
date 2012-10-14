$(document).ready(function(){
  $("table.table-click tbody tr").click(function(){
    campaign_id = $(this).attr("id").split("-")[1];
    document.location.href = '/campaigns/' + campaign_id + '/edit';
  });
});