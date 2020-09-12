class Admin < ApplicationRecord
    has_one :user_profile, as: :user
end
