$(function() {

  $('#send_link').on('click', function(){
    $("#emailModal").modal('show');

   // $('#email_send').on('submit', function(event){
   //  event.preventDefault();

  //   var form_input = $(this).serializeArray();

  //   $.post('/login', form_input).done(function(response){
  //     if (response.user == false) {
  //       unverified_user();
  //       setTimeout(function(){reset_login()}, 1500);
  //     }else{
  //       reset_login();
  //       $("#loginModal").modal('hide');
  //       location.reload();
  //     }
  //   });
  // });
 });

  
});
