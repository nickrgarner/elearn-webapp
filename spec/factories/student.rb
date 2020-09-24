FactoryBot.define do
    factory :student do
        discipline { Discipline.first || association(:discipline) }
    end
  end