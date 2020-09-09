json.extract! profile, :id, :first_name, :last_name, :email, :phone_number, :address, :user_type, :created_at, :updated_at
json.url profile_url(profile, format: :json)
