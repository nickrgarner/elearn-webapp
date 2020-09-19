class Profile < ApplicationRecord
    has_secure_password
    belongs_to :userable, polymorphic: true
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email"}
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true, format: {with: /\A[0-9]{3}(?:-)?[0-9]{3}(?:-)?[0-9]{4}\z/, message:
        "Invalid phone number"}
    validates :address, presence: true

    def name
      [first_name,last_name].join(' ')
    end
  end

  