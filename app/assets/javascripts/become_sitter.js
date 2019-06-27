$(document).on('turbolinks:load', function() {
  
  $('#agree-btn').click(function() {
    var check = $("input[type='checkbox']:checked").length //判斷有多少個方框被勾選
    if (check == 0) {
      alert('你尚未同意條約內容')
      return false //不要提交表單
    } else {
      return true //提交表單
    }
  })

})
