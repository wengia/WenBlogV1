json.array!(@wen_users) do |wen_user|
  json.extract! wen_user, :name, :email, :tel, :addr
  json.url wen_user_url(wen_user, format: :json)
end
