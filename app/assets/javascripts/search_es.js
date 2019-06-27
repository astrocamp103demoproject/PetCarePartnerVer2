$(document).on('turbolinks:load', function() {
    
    $('.btn-primary').click(function() {
      // var check = $("input[type='checkbox']:checked").length //判斷有多少個方框被勾選
      
      if ( Drop_Off.value == "" || Pick_Up.value == "") {
        alert('請確實填寫日期')
        return false //不要提交表單
      } 
      else if(changeDate() >= 0){
        alert('起始日不得等於或低於結束日')
        return false //不要提交表單
      }
      else{
        return true //提交表單
      }
    })
    
  function changeDate(){
    Darr = Drop_Off.value.split('/')
    Parr = Pick_Up.value.split('/')
    result = new Date(Darr[2],Darr[1],Darr[0]) - new Date(Parr[2],Parr[1],Parr[0])
    return result
  }
  })
  