FactoryBot.define do
  factory :donation do
    name {"あああ"}
    price {10000}
    description {"あいうえお"}
    association :user
  end
end
