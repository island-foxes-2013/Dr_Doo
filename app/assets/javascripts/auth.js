$(document).ready(function() {

  $('#login_li').on('click', function(){
    $('#email_field').focus();
    $("#loginModal").modal('show');
    
    
  });

  $('#create_li').on('click', function(){
    $('#name_field').focus();
    $("#createModal").modal('show');
     
  });
});


