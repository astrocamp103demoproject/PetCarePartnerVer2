FactoryBot.define do
  factory :sitter do
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    address { "MyString" }
    avatar { "MyString" }
    pic { "MyString" }
    square_meters { 1 }
    pet_limit { 1 }
    slogan { "MyText" }
    price { 1 }
  end
end
