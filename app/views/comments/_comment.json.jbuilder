json.extract! comment, :id, :name, :content, :created_at, :updated_at
json.url idea_url(comment, format: :json)