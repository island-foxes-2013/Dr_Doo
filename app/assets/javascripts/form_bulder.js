$(function() {
   

  $('.field_type').draggable(draggableOptions(false));

  $('.form_field_catcher').droppable({
    accept: '.field_type',
    drop: function(event, ui){
      var newUiDraggable = ui.draggable.clone();

      $(newUiDraggable).removeClass("field_type").addClass("added");
      $(this).append(newUiDraggable);

      // $(newUiDraggable).css("top", Math.floor(ui.position.top / 10) * 10);
      // $(newUiDraggable).css("left", Math.floor(ui.position.left / 10) * 10);
      $(newUiDraggable).draggable(draggableOptions(true));

      $(newUiDraggable).dblclick(function(){
        $(this).remove();
      });
    }
  });
  
  $('.form_field_catcher').submit(function(){
    $('.selectables').remove();
  });


});

function draggableOptions(withinCatcher) {

  var options = {
    scroll: false,
    grid: [1, 30],
    snap: true,
    snapTolerance: 1,
    preventCollision: true,
    obstacle: ".added"
  };
  if (!withinCatcher) {
    options.revert = 'invalid';
    options.helper = 'clone';
  } else {
    options.containment = '.form_field_catcher';
  }
  return options;
}