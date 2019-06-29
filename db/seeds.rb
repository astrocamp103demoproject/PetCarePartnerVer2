file = File.open("address_six_country_new.txt")
array = JSON.parse(file.read)

# township_array =  ["臺北市中正區","臺北市大同區","臺北市中山區","臺北市松山區","臺北市大安區","臺北市萬華區","臺北市信義區","臺北市士林區","臺北市北投區","臺北市內湖區"]
array.each do |address_six_country| 

# 1.times { 
#     #sitter
    email = Faker::Internet.email
    name = Faker::Name.unique.name
    slogan = Faker::TvShows::GameOfThrones.quote

    price = Faker::Number.number(3)
    # avatar = "https://i.pravatar.cc/300?img=#{rand(1..50)}"
    number = rand(0..9)
    pet_limit = rand(1..5)
    square_meters = rand(20..50)

    Sitter.create(name: name ,email: email, password: '123456', slogan:slogan, address:address_six_country, price:price, pet_limit: pet_limit,square_meters: square_meters)
    puts "."
    sitterid = Faker::Number.number(1)
# }
end