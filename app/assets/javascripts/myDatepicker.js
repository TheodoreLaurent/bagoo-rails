$(document).ready(function(){
  $('#checkin').datepicker({
    clearBtn: true,
    autoclose: true,
    format: "dd/mm/yyyy",
    todayHighlight: true
  });
  $('#checkout').datepicker({
    clearBtn: true,
    autoclose: true,
    format: "dd/mm/yyyy",
    todayHighlight: true
  });
});
