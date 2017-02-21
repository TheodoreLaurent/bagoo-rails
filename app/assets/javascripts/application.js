//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function(){
  $('.button').css( 'cursor', 'pointer' );
  $('.form-control').css( 'cursor', 'pointer' );
  var nowTemp = new Date();
  var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
  var checkin = $('#checkin').datepicker({
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'enabled' : '';
    }
  }).on('changeDate', function(ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1);
      checkout.setValue(newDate);
    }
    checkin.hide();
    $('#checkout')[0].focus();
  }).data('datepicker');
  var checkout = $('#checkout').datepicker({
    onRender: function(date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'enabled' : '';
    }
  }).on('changeDate', function(ev) {
    checkout.hide();
  }).data('datepicker');

});
