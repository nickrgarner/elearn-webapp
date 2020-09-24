FactoryBot.define do
  factory :teacher do
    discipline { Discipline.first || association(:discipline) }
    is_deleted { false }
  end
end
