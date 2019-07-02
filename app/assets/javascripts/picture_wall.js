document.addEventListener('turbolinks:load', () => {
    a = document.getElementById('pictures-count')
    var value = a.getAttribute('data-value')-5
    console.log(value)
    content = "<div class= pic-count>"+"+"+value+"</div>"
    if(value > 0){
        $(".profile-pic-content > div:nth-child(4) > a").append(content);
    }
})
  
        