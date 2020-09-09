json.extract! profile, :id, :first_name, :last_name, :email, :address, :phone_number, :created_at, :updated_at
json.url profile_url(profile, format: :json)
