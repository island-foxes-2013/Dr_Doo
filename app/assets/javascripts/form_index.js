$(function() {

  $('a[data-form]').on('click', function(e){
    e.preventDefault();
  	$('#email').val('');
    $("#emailModal").modal('show');
    $("input[name=form_id]").val($(this).data('form'));
    $('#email_submit').on('click', function(){
      $("#emailModal form_id").val('');
    	$("#emailModal").modal('hide');
    });
  });
   $('#email_form').on('ajax:success', function(e, data){
    console.log(notification);
   });
});
