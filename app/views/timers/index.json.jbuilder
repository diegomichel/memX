json.array!(@timers) do |timer|
  json.extract! timer, :id, :start, :end, :list_id, :test_id
  json.url timer_url(timer, format: :json)
end
