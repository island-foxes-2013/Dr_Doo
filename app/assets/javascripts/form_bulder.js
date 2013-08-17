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



var dropped = false;
  $(".well").droppable({
     drop: function(event, ui) {
            dropped = true;
            $.ui.ddmanager.current.cancelHelperRemoval = true;
            ui.helper.appendTo(this);
    }
 });
 $(".item").draggable({
     revert: 'invalid',
     helper: function(){
        $copy = $(this).clone();
        return $copy;
     },
      start: function(event, ui) {
                    dropped = false;
                    // $(this).addClass("hide");
                },
                stop: function(event, ui) {
                    if (dropped==true) {
                        // $(this).remove();
                    } else {
                        // $(this).removeClass("hide");
                    }
                    $(this).draggable({revert: 'invalid'});
                }
        });





//   var div = $('#resizable');
// div.resizable(
//     {
//         stop: function(event, ui)
//         {                        
//             var top = getTop(ui.helper);
//             ui.helper.css('position', 'fixed');
//             ui.helper.css('top', top+"px");            
//         }        
//     });
//     div.draggable(
//         {    grid: [10,10],
//         stop: function(event, ui)
//         {            
//             var top = getTop(ui.helper);
           
//         }
//     });
//     function getTop(ele)
//     {
//         var eTop = ele.offset().top;
//         var wTop = $(window).scrollTop();
//         var top = eTop - wTop;
        
//         return top;    
//     }
         // $(":text").prop("disabled", true);
        // $('.input').draggable({
        //    revert: 'invalid',
        //   helper: 'clone'
        // });

 
        // $('.well').droppable({
        //   accept: 'div',
        //   drop: function(ev, ui) {
        //     grid: [10, 10]
        //     ui.helper.css('position', 'fixed');
        //     var droppedItem = $(ui.draggable).clone();
        //     $(droppedItem).children().addClass('added');
        //     $(this).append(droppedItem);

            // console.log(this)
            // var sum = 0
            // $('#grocery_list .item').each(function() {
            //   sum += new Number($(this).find('td').last().text());
            // });
            // $('#grocery_list td').last().text((sum).toFixed(2));
        //   }
        // });


        // $('#containter-left').bind('dblclick', function(e){
        //   if ($(e.target).hasClass('added')){
        //     $(e.target).remove();
        //   }
        //   // $(e.target).remove();
        // });
        // $('#drag_it').mouseup(function(){

        // })
   


});