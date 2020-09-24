FactoryBot.define do
    factory :course do
        course_number   { 517 }
        name    { "Object oriented design development" }
        area    { "Software Engineering"}
        price   { 999 }
        discipline { Discipline.first || association(:discipline) }
    end
  end