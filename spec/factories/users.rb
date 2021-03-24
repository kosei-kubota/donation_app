FactoryBot.define do
  factory :user do
    nickname {"taro"}
    email {"test@example.com"}
    password {"abcd1234"}
    password_confirmation {"abcd1234"}
  end
end
