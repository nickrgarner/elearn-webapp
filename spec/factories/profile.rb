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
        trait :student_type do
            userable { Student.first || association(:student) }
        end
        trait :teacher_type do
            userable { Teacher.first || association(:teacher) }
        end
        trait :admin_type do
            userable { Admin.first || association(:admin) }
        end
    end
end
