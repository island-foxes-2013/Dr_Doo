// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

$(document).ready(function() {

  $('#login_li').on('click', function(){
    //reset_login();
    $("#loginModal").modal('show');

    $('#login').on('submit', function(event){
      event.preventDefault();

      var form_input = $(this).serializeArray();

      $.post('/login', form_input).done(function(response){
        if (response.user == false) {
          unverified_user();
          setTimeout(function(){reset_login()}, 1500);
        }else{
          reset_login();
          $("#loginModal").modal('hide');
          location.reload();
        }
      });
    });
  });

  $('#create_li').on('click', function(){
    //reset_create();
    $("#createModal").modal('show');

    $('#create').on('submit', function(event){
      event.preventDefault();

      var form_input = $(this).serializeArray();

      $.post('/login', form_input).done(function(response){
        if (response.user == false) {
          unverified_user();
          setTimeout(function(){reset_login()}, 1500);
        }else{
          reset_login();
          $("#createModal").modal('hide');
          location.reload();
        }
      });
    });
  });
});

function reset_login(){
  $('.modal-footer button').removeClass('btn-danger').addClass('btn-inverse');
  $('.modal-footer button').text('Login');
  $("#login")[0].reset();
  $('#email').focus();
}

function unverified_user(){
  $('.modal-footer button').removeClass('btn-inverse').addClass('btn-danger');
  $('.modal-footer button').text('- email or password incorrect -');
}