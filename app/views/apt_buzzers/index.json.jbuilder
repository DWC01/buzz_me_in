json.array!(@apt_buzzers) do |apt_buzzer|
  json.extract! apt_buzzer, :id
  json.url apt_buzzer_url(apt_buzzer, format: :json)
end
