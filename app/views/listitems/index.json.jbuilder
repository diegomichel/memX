json.array!(@listitems) do |listitem|
  json.extract! listitem, :id, :text, :list_id, :previous_item_id
  json.url listitem_url(listitem, format: :json)
end
