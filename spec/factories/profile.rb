FactoryBot.define do
    sequence(:email) {|n| "user#{1}@fake.com"}
    factory :profile do
        first_name { "John" }
        last_name { "Doe" }
        email { FactoryBot.generate :email }
        phone_number { 9999999999 }
        address { "Raleigh,NC" } 
        password { "123" } 
        password_confirmation { "123" }
        userable { Student.first || association(:student) }
    end
end