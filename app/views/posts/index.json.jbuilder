json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :header
  json.url post_url(post, format: :json)
end
