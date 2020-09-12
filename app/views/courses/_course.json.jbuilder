json.extract! course, :id, :coursenumber, :name, :area, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
