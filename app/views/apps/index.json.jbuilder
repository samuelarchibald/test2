json.array!(@apps) do |app|
  json.extract! app, :id, :name, :store, :url, :description
  json.url app_url(app, format: :json)
end
