# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times { 
    email = Faker::Internet.email
    name = Faker::Name.unique.name
    slogan = Faker::Lorem.paragraph(2, true)
    price = Faker::Number.number(3)
    
    Sitter.create(name: name ,email: email, password: '123456', slogan:slogan, address:'高雄市大寮區', price:price)
    
}
