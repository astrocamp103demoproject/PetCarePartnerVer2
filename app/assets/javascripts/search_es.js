$(document).on('turbolinks:load', function() {
    $('.btn-primary').click(function() {
      //先判斷日期，再判斷貓狗，再判斷選擇寵物數量   
      if ( Drop_Off.value == "" || Pick_Up.value == "") {
        alert('請確實填寫日期')
        return false //不要提交表單
      } 
      else if(changeDate() >= 0){
        alert('起始日不得等於或低於結束日')
        return false //不要提交表單
      }
      else{
        if($("#dog").prop("checked")||$("#cat").prop("checked")){
          if(pet_count() == 0){
            alert('寵物數量不得為0')
            return false
          }else{
            return true //提交表單
          }
          
        }
        else{
          alert('請選擇貓狗')
          return false 
        }
      }
    })
    
    function changeDate(){
      Darr = Drop_Off.value.split('/')
      Parr = Pick_Up.value.split('/')
      result = new Date(Darr[2],Darr[1],Darr[0]) - new Date(Parr[2],Parr[1],Parr[0])
      return result
    }
    function pet_count(){
      return parseInt(xs_count.value) + parseInt(s_count.value) + parseInt(m_count.value) + parseInt(l_count.value)
      
    }
  })
  