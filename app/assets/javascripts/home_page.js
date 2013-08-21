$(function() {
  $("form#sign_in_user").on("ajax:success", function(e, data, status, xhr) {
    window.location = data.redirect_to;
  });

  $("form#sign_in_user").on("ajax:error", function(e, xhr, message, status) {
    $('.modal-footer').prependTo.(xhr.responseJSON.errors);
  });

  $("form#sign_up_user").on("ajax:success", function(e, data, status, xhr) {
    window.location = data.redirect_to;
  });

  $("form#sign_in_user").on("ajax:error", function(e, xhr, message, status) {
    $('.modal-footer').prependTo.(xhr.responseJSON.errors);
  });

});
