json.array!(@admin_wall_posts) do |admin_wall_post|
  json.extract! admin_wall_post, 
  json.url admin_wall_post_url(admin_wall_post, format: :json)
end
