$(document).on('turbolinks:load', function() {
  $('.booked')
    .css('color', '#fff')
    .closest('td')
    .css('background-color', '#fbb')

  $('.closure')
    .css('color', '#fff')
    .closest('td')
    .css('background-color', '#bbf')

  $('.pagination')
    .closest('nav')
    .css('display', 'flex')
    .css('justify-content', 'center')
})
