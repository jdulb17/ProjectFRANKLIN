json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :answer, :question
  json.url user_url(user, format: :json)
end
