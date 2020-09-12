class Profile < ApplicationRecord
  has_secure_password
  belongs_to :user, polymorphic: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :user_type, presence: true, inclusion: { in: %w(admin student teacher),
    message: "%{value} is not a valid size" }
end
