class CreditCard < ApplicationRecord
    validates :name, presence: true
    validates :card_number, length: { is: 16 }, numericality: { only_integer: true }
    validates :expiration_date, presence: true
    validates :cvv, length: { is: 3 }, numericality: { only_integer: true }
    belongs_to :student
end
