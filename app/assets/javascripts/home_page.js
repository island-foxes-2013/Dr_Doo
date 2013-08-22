$(function() {
  $("#sign_in_user").on("ajax:success", function(e, data, status, xhr) {
    window.location = data.redirect_to;
  });

  $("#sign_in_user").on("ajax:error", function(e, xhr, message, status) {
    $('.alert').append(xhr.responseJSON.errors).css('color', 'red');
  });

  $("#sign_up_user").on("ajax:success", function(e, data, status, xhr) {

    window.location = data.redirect_to;
  });

  $("#sign_up_user").on("ajax:error", function(e, xhr, message, status) { 
  });

});
