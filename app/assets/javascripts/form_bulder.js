$(function() {
  // $('.field').draggable();
  // var $elem = $('')
  // $('.name_field').draggable();

 // $(".gridster ul").gridster({
 //        widget_margins: [10, 10],
 //        widget_base_dimensions: [140, 140]
 //    });

 //   var gridster = $(".gridster li").gridster().data('gridster');

// gridster.add_widget('<li class="new">The HTML of the widget...</li>', 2, 1);


  

         // $(":text").prop("disabled", true);
        $('.input').draggable({
          helper: 'clone'
        });

 
        $('.well').droppable({
          accept: 'div',
          drop: function(ev, ui) {
            var droppedItem = $(ui.draggable).clone();
            $(droppedItem).children().addClass('added');
            $(this).append(droppedItem);
            // console.log(this)
            // var sum = 0
            // $('#grocery_list .item').each(function() {
            //   sum += new Number($(this).find('td').last().text());
            // });
            // $('#grocery_list td').last().text((sum).toFixed(2));
          }
        });





    
        // $('#containter-left').bind('dblclick', function(e){
        //   if ($(e.target).hasClass('added')){
        //     $(e.target).remove();
        //   }
        //   // $(e.target).remove();
        // });
        // $('#drag_it').mouseup(function(){

        // })
   


});