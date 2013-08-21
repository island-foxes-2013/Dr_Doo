$(function() {
  $("#sign_in_user").on("ajax:success", function(e, data, status, xhr) {
    window.location = data.redirect_to;
  });

  $("#sign_in_user").on("ajax:error", function(e, xhr, message, status) {
    console.log('this is sign_in or is it')
    console.log(xhr)
    $('#sign_in_password').append(xhr.responseJSON.errors).css('color', 'red');
  });

  $("#sign_up_user").on("ajax:success", function(e, data, status, xhr) {

    window.location = data.redirect_to;
  });

  $("#sign_up_user").on("ajax:error", function(e, xhr, message, status) {
    $('#sign_up_password').append(xhr.responseJSON.errors).css('color', 'red');
  });

});
