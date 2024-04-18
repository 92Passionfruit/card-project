json.extract! card, :id, :card_name, :collection_name, :created_at, :updated_at
json.url card_url(card, format: :json)
