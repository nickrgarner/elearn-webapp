class Student < ApplicationRecord
    has_one :user_profile, as: :user 
    belongs_to :discipline
    has_one :credit_card, dependent: :destroy
    has_one :cart, dependent: :destroy
    has_many :purchase_history
    has_many :course_section
    has_many :feedback
    has_many :teacher , through: :course_section
end
