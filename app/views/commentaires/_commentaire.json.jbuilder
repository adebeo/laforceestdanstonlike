json.extract! commentaire, :id, :comment, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)