class CreditCard < ApplicationRecord
    validates :name, presence: true
    validates :card_number, length: { is: 16 }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :expiration_date, presence: true
    validates :cvv, length: { is: 3 }, numericality: { only_integer: true }
    belongs_to :student
end
