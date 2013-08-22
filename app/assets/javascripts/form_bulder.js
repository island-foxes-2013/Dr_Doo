$(function() {
   

  $('.field_type').draggable(draggableOptions(false));
  $('.added').draggable(draggableOptions(true));
  $('.form_block.well').on('dblclick', '.added', function() {
    $(this).remove();
  });
  
  $('.form_block.well').droppable({
    accept: '.field_type',
    drop: function(event, ui){
      var newUiDraggable = ui.draggable.clone();

      $(newUiDraggable).removeClass('field_type').addClass("added");
      $('.form_field_catcher').append(newUiDraggable);

      $(newUiDraggable).draggable(draggableOptions(true));
    }
  });
  
  $('.form_field_catcher').submit(function(){
    $('.selectables').remove();
  });
});

function draggableOptions(withinCatcher) {

  var options = {
    scroll: false,
    grid: [10, 79],
    snap: true,
    snapTolerance: 0
  };

  if (!withinCatcher) {
    options.revert = 'invalid';
    options.helper = 'clone';
  } else {
    options.helper = "original";
    options.containment = '.form_block.well';
  }
  return options;
}