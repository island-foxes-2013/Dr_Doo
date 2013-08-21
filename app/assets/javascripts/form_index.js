//////////////
// Old Code //
//////////////

// $(function() {
$(document).ready(function() {

  $('a[data-form]').on('click', function(e){
    // e.preventDefault();
  	$('#email').val('');
    $("#emailModal").modal('show');
    $("input[name=form_id]").val($(this).data('form'));
    $('#email_submit').on('click', function(){
      $("#emailModal form_id").val('');
    	 $("#emailModal").modal('hide');
    });
  });

  NotificationsController.bindEvents();
   // $(document).on('ajax:success', 'form#email_submit', function() {

   //  alert('AJAX SUCCESS');
   //  alert($('h4').first().text());

   //  if ($('h4').first().text() === 'You have no new notifications.') {
   //    alert('There are not previous notifications');
   //  }
   //  else if ($('h4').first().text() === 'You have new notifications!') {
   //    alert('There are previous notifications');
   //  }
   // });
});

/////////////////////////////////
// Migrated Rails AJAX Example //
/////////////////////////////////

// $(document).ready(function() {
  // NotifcationsController.bindEvents();
// });

  var NotificationsController = {
    bindEvents: function() {
  //     // ajax:beforeSend (before form is submitted)
  //     // ajax:success (when server returns successfully)
  //     // ajax:error (when server returns unsuccessfully)
  //     // ajax:complete (when server returns no matter what)

  //     // listen for new_question_answer_path link
  //     $(document).on('ajax:success', $('div#click_new_answer'), this.onLinkSuccess);
      
  //     // listen for something other than document eventually
  //     // here I'll need page to go away on complete
      $(document).on('ajax:beforeSend', '#email_submit', this.beforeSend);
      $(document).on('ajax:success', '#email_submit', this.onSuccess);
      $(document).on('ajax:error', '#email_submit', this.onError);
    },

    beforeSend: function(e) {
      window.alert("THIS ACTUALLY WORKS");
      $("#emailModal form_id").val('');
      $("#emailModal").modal('hide');
    },

    onSuccess: function(e, response, status, xhr) {
      window.alert("SUCCESS!");
    },

    onError: function(e, xhr, status, message) {
      if (xhr.responseJSON == null)
      {
        window.alert("remember to log in or create an account");
      }
      else
      {
        $(e.target).parent().html(xhr.responseJSON.html);
      }
    }

  //   onLinkSuccess: function(e, partial, status, xhr) {
  //     $(this).find('div#create_answer').html(partial.html);
  //     $(this).find('div.answer_display').remove();
  //   }
  //   //Vote Ajax Call
  //   // $(document.on("click", '.up_vote' function(){
  //   // $(".up_vote").bind('ajax:success', function(){
  //   // alter("Success!")
  //   // }
  //   // });
  }

  // NotifcationsController.bindEvents();
// });