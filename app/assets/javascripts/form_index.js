$(document).ready(function() {

  $('a[data-form]').on('click', function(e){
  	$('#email').val('');
    $("#emailModal").modal('show');
    $("input[name=form_id]").val($(this).data('form'));
  });

  NotificationsController.bindEvents();

  $('.delete_link').on('ajax:success', function(e, data){
    if(data.success == true){
      $(data.notification).remove();
    }
  });
});

var NotificationsController = {
  bindEvents: function() {
  // ajax:beforeSend (before form is submitted)
  // ajax:success (when server returns successfully)
  // ajax:error (when server returns unsuccessfully)
  // ajax:complete (when server returns no matter what)
    $(document).on('ajax:beforeSend', '#email_form', this.beforeSend);
    $(document).on('ajax:success', '#email_form', this.onSuccess);
    $(document).on('ajax:error', '#email_form', this.onError);
  },

  beforeSend: function(e) {
    // Put a loading animation here.
  },

  onSuccess: function(e, response, status) {
    if (response["error"] === "Email cannot be blank.")
    {
      $('#errors').text();
      $('#errors').text(response["error"]);
    }
    else
    {
      $("#emailModal form_id").val('');
      $("#emailModal").modal('hide');
      if ($('h4').first().text() === 'You have no new notifications.') {
        $('h4').first().text('You have new notifications!');
        $('.notifications').append('<h6 class=\"heading\">You have sent a request to complete your \"<span class="form_title">' + response["form_title"] + '</span>' + '\" form to <span class="email_notify">' + response["recipient_email"] + '</span>.</h6>');
      }
      else if ($('h4').first().text() === 'You have new notifications!') {
        $('.notifications').append('<h6 class=\"heading\">You have sent a request to complete your \"<span class="form_title">' + response["form_title"] + '\" form to <span class="email_notify">' + response["recipient_email"] + '</span>.</h6>');
      }
    }
  },

  onError: function(e, xhr, status, message) {
    alert(response["error"]);
  }
}
