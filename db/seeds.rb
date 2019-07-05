file = File.open("address_six_country_new.txt")
array = JSON.parse(file.read)

# township_array =  ["臺北市中正區","臺北市大同區","臺北市中山區","臺北市松山區","臺北市大安區","臺北市萬華區","臺北市信義區","臺北市士林區","臺北市北投區","臺北市內湖區"]
# array.each do |address_six_country| 
#0-247

# url = "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/uploads/picture/pic/for-seed/"

10.times { 
#     #sitter
    name = Faker::Name.unique.name
    email = name.split(' ')
    slogan = Faker::TvShows::GameOfThrones.quote
    # price = Faker::Number.number(3)
    price = rand(250..500)
    # avatar = "https://i.pravatar.cc/300?img=#{rand(1..50)}"
    number = rand(0..9)
    pet_limit = rand(1..5)
    square_meters = rand(20..50)
    pic_mount = rand(10..20)
    avatar = rand(1..66)
    address = rand(0..5)
    #建立保母 25~33
    puts "."
    user = User.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', address:array[address],role: 'sitter')
    # binding.pry
    puts "."
    Sitter.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', slogan:slogan, address:array[address], price:price, pet_limit: pet_limit,square_meters: square_meters)
    puts "."
    pic_mount.times{
        pic = rand(1..239)       
        Picture.create(pic: "photo"+pic.to_s+".jpg",user_id: user.id)
    }
    puts "."
    #建立使用者用這條
    # user = User.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', address:array[address])
}
# end

# 1.times { 
#     #sitter
#     email = Faker::Internet.email
#     name = Faker::Name.unique.name
#     slogan = Faker::TvShows::GameOfThrones.quote

#     price = Faker::Number.number(3)
#     avatar = "https://api.adorable.io/avatars/285/#{Faker::Alphanumeric.alpha 5}@adorable.io.png"
#     pic = "https://picsum.photos/300/300"
#     number = rand(0..9)


#     Sitter.create(avatar: avatar, name: name ,email: email, password: '123456', slogan:slogan, address:township_array[number], price:price, pet_limit: '3', pic: pic,square_meters: number)
# }

