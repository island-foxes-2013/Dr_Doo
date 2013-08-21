$(function() {

  $('.send_link').on('click', function(){
  	$('#email').val('');
    $("#emailModal").modal('show');
    $('#email_submit').on('click', function(){
    	 $("#emailModal").modal('hide');
    });
  });

   $('#email_form').on('ajax:success', function(e, data){
   });
});
