class Profile < ApplicationRecord
  has_secure_password
  belongs_to :userable, polymorphic: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
end
