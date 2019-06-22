$(document).on('turbolinks:load', function() {
  $('.booked')
    .css('color', '#fff')
    .closest('td')
    .css('background-color', '#fbb')

  $('.pagination')
    .closest('nav')
    .css('display', 'flex')
    .css('justify-content', 'center')
})
