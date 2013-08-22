$(function() {
  $("#sign_in_user").on("ajax:success", function(e, data, status, xhr) {
    window.location = data.redirect_to;
  });

  $("#sign_in_user").on("ajax:error", function(e, xhr, message, status) {
    console.log('this is sign_in or is it')
    console.log(xhr)
    $('.alert').append(xhr.responseJSON.errors).css('color', 'red');
  });

  $("#sign_up_user").on("ajax:success", function(e, data, status, xhr) {

    window.location = data.redirect_to;
  });

  $("#sign_up_user").on("ajax:error", function(e, xhr, message, status) {
    console.log(xhr)
    // var length = arr.length
    //     element = null
    // for(var i = 0; i < length, i++) {
    //   $('.alert').append();
    // }
    
  });

});
