file = File.open("address_six_country_test.txt")
array = JSON.parse(file.read)

township_array =  ["臺北市中正區","臺北市大同區","臺北市中山區","臺北市松山區","臺北市大安區","臺北市萬華區","臺北市信義區","臺北市士林區","臺北市北投區","臺北市內湖區"]
# array.each do |address_six_country| 


1.times { 
#     #sitter

    email = Faker::Internet.email
    name = Faker::Name.unique.name
    slogan = Faker::TvShows::GameOfThrones.quote

    price = Faker::Number.number(3)
    # avatar = "https://i.pravatar.cc/300?img=#{rand(1..50)}"
    number = rand(0..9)
    pet_limit = rand(1..5)
    square_meters = rand(20..50)

    Sitter.create( name: name ,email: email, password: '123456', slogan:slogan, address:"臺北市中正區", price:price, pet_limit: pet_limit,square_meters: square_meters)

    puts "."
    User.create( name: name ,email: email, password: '123456', address:"臺北市中正區")
    puts "."
    sitterid = Faker::Number.number(1)
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

