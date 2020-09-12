class Admin < ApplicationRecord
    has_one :profile, as: :userable
    accepts_nested_attributes_for :profile
end
