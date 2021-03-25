FactoryBot.define do
  factory :user do

    


    

    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcde12345'}
    password_confirmation {password}
  end
end


