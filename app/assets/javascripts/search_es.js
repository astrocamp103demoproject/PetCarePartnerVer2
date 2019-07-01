document.addEventListener('turbolinks:load', () => {

  // $('#search-error').hide()  
    $('#btn-primary').click(function() {
      // btnnnn.addEventListener('click',function(){
      //先判斷日期，再判斷貓狗，再判斷選擇寵物數量   
      if ( Drop_Off.value == "" || Pick_Up.value == "") {
        errorContent("請選擇日期")
        return false //不要提交表單
      } 
      else if(changeDate() >= 0){
        errorContent("不能選擇過去時間哦")
        return false //不要提交表單
      }
      else{
        if($("#dog").prop("checked")||$("#cat").prop("checked")){
          if(petCount() == 0){
            errorContent("請選擇寵物數量")
            return false
          }else{
            return true //提交表單
          }
          
        }
        else{
          errorContent("請選擇貓狗")
          return false 
        }
      }
    })


    $('.error-close').click(function(){
      $('#search-error').hide()  
    })

    function errorContent(content){
      $("#error-content").replaceWith('<div class="error-content" id="error-content">'+content+'</div>')
      $('#search-error').show()
    }

    function changeDate(){
      
      Darr = Drop_Off.value.split('/')
      Parr = Pick_Up.value.split('/')
      result = ((new Date(Darr[2],Darr[0],Darr[1]) - new Date(Parr[2],Parr[0],Parr[1]))/ 60000 /24/60)
      return result
    }
    function petCount(){
      return parseInt(xs_count.value) + parseInt(s_count.value) + parseInt(m_count.value) + parseInt(l_count.value)
      
    }
})
  
