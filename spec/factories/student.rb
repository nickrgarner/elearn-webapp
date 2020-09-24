FactoryBot.define do
    factory :student do
        discipline { Discipline.first || association(:discipline) }
        is_deleted { false }
    end
  end