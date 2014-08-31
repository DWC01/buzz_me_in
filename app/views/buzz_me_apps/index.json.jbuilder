json.array!(@buzz_me_apps) do |buzz_me_app|
  json.extract! buzz_me_app, :id
  json.url buzz_me_app_url(buzz_me_app, format: :json)
end
