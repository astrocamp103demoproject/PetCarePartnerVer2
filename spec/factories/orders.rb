FactoryBot.define do
  factory :order do
    user { nil }
    drop_off { "2019-06-11 15:35:13" }
    pick_up { "2019-06-11 15:35:13" }
    note { "MyText" }
    status { "MyString" }
    checkout_time { "2019-06-11 15:35:13" }
  end
end
