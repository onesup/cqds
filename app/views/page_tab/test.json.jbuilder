json.array!(@wall_posts) do |wall_post|
  json.extract! wall_post, :message
end
