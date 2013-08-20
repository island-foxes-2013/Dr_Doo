function draggableOptions(withinCatcher) {
  var options = {
    scroll: false,
    grid: [30, 30],
    snap: true,
    snapTolerance: 1,
    preventCollision: true,
    obstacle: ".added"
  };
  if (withinCatcher) {
    options.containment = '.form_field_catcher';
  } else {
    options.revert = 'invalid';
    options.helper = 'clone';
  }
  return options;
}

$(function() {   

  $('.field_type').draggable(draggableOptions(false));

  $('.form_field_catcher').droppable({
    accept: '.field_type',
    drop: function(event, ui){
      var $newUiDraggable = ui.draggable.clone();
      var position = {
        left: Math.floor( (ui.position.left - this.offsetLeft) / 10 ) * 10,
        top: Math.floor( (ui.position.top - this.offsetTop) / 10 ) * 10
      };

      console.log('droppable position (relative to page):', {left: this.offsetLeft, top: this.offsetTop});
      console.log('drop position (relative to page):', {left: ui.position.left, top: ui.position.top});
      console.log('drop position (relative to droppable):', position);

      $newUiDraggable.removeClass("field_type").addClass("added");
      $(this).append($newUiDraggable);
      $newUiDraggable.css(position);
      console.log('drop position (relative to droppable):', {left: $newUiDraggable.css("left"), top: $newUiDraggable.css("top")});
      $newUiDraggable.draggable(draggableOptions(true));

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
