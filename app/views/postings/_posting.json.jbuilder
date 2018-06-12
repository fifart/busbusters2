json.extract! posting, :id, :title, :body, :user_id, :type_id, :created_at, :updated_at
json.url posting_url(posting, format: :json)
