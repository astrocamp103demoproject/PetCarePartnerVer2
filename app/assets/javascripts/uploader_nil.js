document.addEventListener('turbolinks:load', () => {
  //picture new
  $('#add-pic').click(function() {
    if (picture_pic.value == '') {
      alert('尚未選擇圖片')
      return false
    } else {
      return true
    }
  })
  //user profile edit
  $('#user-edit').click(function() {
    if (user_avatar.value == '') {
      alert('尚未選擇頭貼')
      return false
    } else {
      return true
    }
  })
  //sitter profile edit
  $('#sitter-edit').click(function() {
    if (sitter_avatar.value == '') {
      alert('尚未選擇頭貼')
      return false
    } else {
      return true
    }
  })
  //pet new
  $('#add-pet-pic').click(function() {
    if (pet_pic.value == '') {
      alert('尚未選擇圖片')
      return false
    } else {
      return true
    }
  })
})
