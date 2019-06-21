$(document).on("turbolinks:load",function(){
    $('.pagination').on("ajax:success", function(event, data) {
        var event_area = $('#sitters-content');
        console.log('kaminari'+data)
        event_area.html( data.name );
    });


});