json.extract! user, :id, :username, :password, :fullname, :company_id, :telnumber, :created_at, :updated_at
json.url user_url(user, format: :json)
