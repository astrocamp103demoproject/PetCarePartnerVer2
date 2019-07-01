FactoryBot.define do
  factory :comment do
    sitter { nil }
    user { nil }
    message { "MyText" }
  end
end
