$(document).on('turbolinks:load', function() {
  $('.pagination')
    .closest('nav')
    .css('display', 'flex')
    .css('justify-content', 'center')
})
