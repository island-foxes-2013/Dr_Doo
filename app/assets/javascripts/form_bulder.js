function draggableOptions(isFieldType) {
  var options = {
    scroll: false,

    // snap to grid
    grid: [30, 30],
    snap: true,
    snapTolerance: 1,

    // jquery-ui-draggable-collision
    restraint: '.form_field_catcher',
    preventCollision: true,
    preventProtrusion: true,
    obstacle: '.obstacle',
    start: function(e, ui) {
      ui.helper.removeClass('obstacle');
    },
    stop: function(e, ui) {
      ui.helper.addClass('obstacle');
    }
  };

  if (isFieldType) {
    $.extend(
      options,
      {
        revert: 'invalid',
        helper: 'clone'
      }
    );
  }

  return options;
}

$(function() {   

  $('.field_type').draggable(draggableOptions(true));

  $('.form_field_catcher').droppable({
    accept: '.ui-draggable',
    drop: function(event, ui){
      var $newUiDraggable = ui.draggable.clone();
      var position = {
        left: Math.floor( (ui.position.left - this.offsetLeft) / 10 ) * 10,
        top: Math.floor( (ui.position.top - this.offsetTop) / 10 ) * 10
      };

      // console.log('droppable position (relative to page):', {left: this.offsetLeft, top: this.offsetTop});
      // console.log('drop position (relative to page):', {left: ui.position.left, top: ui.position.top});
      // console.log('drop position (relative to droppable):', position);

      $newUiDraggable.removeClass("field_type").addClass("added").addClass("obstacle");
      $(this).append($newUiDraggable);
      $newUiDraggable.css(position);
      $newUiDraggable.draggable(draggableOptions(false));

      $newUiDraggable.dblclick(function(){
        $(this).remove();
      });
    }
  });
  
  $('.form_field_catcher').submit(function(){
    $('.selectables').remove();
  });

  // $('.form_field_catcher').on('ajax:success', function(e, data){
  //   console.log(data)
  //   // var comment = $('.comment_append').last().clone();    
  //   // $(comment).text(data.comment.content).append('<br><span class="comment_date">comment by: <b>' + data.user.username + '</b> on ' + formatDate() + '</span>').insertAfter($(this).parent().find('hr').last());
  //   // $(this).parent().find('.comment_append').last().append('<hr />');
  //   // $('.comment_form textarea').val('');
  // });

});
